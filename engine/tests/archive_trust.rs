//! Synthetic headers exercise consistency checks; they are never executed.
use serde_json::{json, Value};
use std::{fs, io::Write, path::Path};
use stm_neurosymbolic::tooling::{archive, base::*, release};

fn fixture(root: &Path) -> String {
    fs::create_dir(root.join("scripts")).unwrap();
    fs::write(
        root.join("release.json"),
        include_bytes!("../../release.json"),
    )
    .unwrap();
    fs::write(root.join("RELEASE_MANIFEST.json"), b"{}").unwrap();
    fs::write(root.join("SHA256SUMS.txt"), b"").unwrap();
    write(&root.join("scripts/release_files.json"), &json!({"files":["RELEASE_MANIFEST.json","SHA256SUMS.txt","release.json","scripts/release_files.json"]})).unwrap();
    release::refresh(root).unwrap();
    hash(&fs::read(root.join("RELEASE_MANIFEST.json")).unwrap())
}
fn binary(platform: &str) -> Vec<u8> {
    let mut data = vec![0; 128];
    if platform == "linux" {
        data[..6].copy_from_slice(b"\x7fELF\x02\x01");
        data[16] = 3;
        data[18] = 62;
    } else {
        data[..2].copy_from_slice(b"MZ");
        data[60] = 64;
        data[64..70].copy_from_slice(b"PE\0\0\x64\x86");
        data[88..90].copy_from_slice(b"\x0b\x02");
    }
    data
}
type Entry = (String, Vec<u8>, u32);
fn package(platform: &str, pin: &str) -> Vec<Entry> {
    let suffix = if platform == "windows" { ".exe" } else { "" };
    let mut entries = vec![
        (
            format!("stm-neurosymbolic{suffix}"),
            binary(platform),
            0o755,
        ),
        (format!("stm-tool{suffix}"), binary(platform), 0o755),
        ("LICENSE".into(), b"public license fixture".to_vec(), 0o644),
        ("NOTICE.md".into(), b"public notice fixture".to_vec(), 0o644),
    ];
    let metadata: Value = serde_json::from_slice(include_bytes!("../../release.json")).unwrap();
    let manifest = json!({"engine_version":metadata["engine_version"],"kb_version":metadata["kb_version"],"platform":platform,"architecture":"x86_64","source_manifest_sha256":pin,"status":"candidate_independent_acceptance_pending","files":entries.iter().map(|(name,data,_)|json!({"path":name,"sha256":hash(data)})).collect::<Vec<_>>()});
    entries.push(("BINARY_MANIFEST.json".into(), canonical(&manifest), 0o644));
    entries
}
fn zip(path: &Path, entries: &[Entry]) -> String {
    let mut writer = zip::ZipWriter::new(fs::File::create(path).unwrap());
    for (name, data, mode) in entries {
        writer
            .start_file(
                name,
                zip::write::SimpleFileOptions::default()
                    .system(zip::System::Unix)
                    .compression_method(zip::CompressionMethod::Stored)
                    .unix_permissions(*mode),
            )
            .unwrap();
        writer.write_all(data).unwrap();
    }
    writer.finish().unwrap();
    hash(&fs::read(path).unwrap())
}
#[test]
fn native_packages_bind_platform_source_and_exact_members_before_extraction() {
    for platform in ["windows", "linux"] {
        let dir = tempfile::tempdir().unwrap();
        let root = dir.path();
        let pin = fixture(root);
        let entries = package(platform, &pin);
        let path = root.join("native.zip");
        let digest = zip(&path, &entries);
        let target = root.join("new/native");
        let report = archive::native(root, &path, &digest, &pin, platform, "x86_64", None).unwrap();
        assert_eq!(report["extracted"], false);
        assert_eq!(report["independent_acceptance"], false);
        assert_eq!(report["deployment_authorization"], false);
        assert!(!target.parent().unwrap().exists());
        archive::native(
            root,
            &path,
            &digest,
            &pin,
            platform,
            "x86_64",
            Some(&target),
        )
        .unwrap();
        for (name, data, _) in entries {
            assert_eq!(fs::read(target.join(name)).unwrap(), data);
        }
        assert!(archive::native(
            root,
            &path,
            &digest,
            &pin,
            platform,
            "x86_64",
            Some(&target)
        )
        .is_err());
    }
}
#[test]
fn external_pins_and_target_constraints_fail_without_creating_output() {
    let dir = tempfile::tempdir().unwrap();
    let root = dir.path();
    let pin = fixture(root);
    let path = root.join("native.zip");
    let digest = zip(&path, &package("windows", &pin));
    let target = root.join("new/native");
    for (archive_pin, source_pin, platform, arch) in [
        ("0".repeat(64), pin.clone(), "windows", "x86_64"),
        (digest.clone(), "0".repeat(64), "windows", "x86_64"),
        (digest.clone(), pin.clone(), "linux", "x86_64"),
        (digest.clone(), pin.clone(), "windows", "aarch64"),
    ] {
        assert!(archive::native(
            root,
            &path,
            &archive_pin,
            &source_pin,
            platform,
            arch,
            Some(&target)
        )
        .is_err());
        assert!(!target.parent().unwrap().exists());
    }
}
#[test]
fn native_tampering_cannot_be_repaired_by_only_repinning_the_archive() {
    let dir = tempfile::tempdir().unwrap();
    let root = dir.path();
    let pin = fixture(root);
    let path = root.join("native.zip");
    let target = root.join("new/native");
    for mutation in 0..7 {
        let mut entries = package("windows", &pin);
        match mutation {
            0 => entries[0].1.push(1), // member digest
            1 => entries.push(("extra".into(), vec![], 0o644)),
            2 => {
                entries.remove(0);
            }
            3 => entries[0].2 = 0o644,
            4 => {
                // matching digest cannot conceal a mismatched machine header
                entries[0].1[68] = 0;
                let mut manifest: Value = serde_json::from_slice(&entries[4].1).unwrap();
                manifest["files"][0]["sha256"] = json!(hash(&entries[0].1));
                entries[4].1 = canonical(&manifest);
            }
            5 => {
                let mut m: Value = serde_json::from_slice(&entries[4].1).unwrap();
                m["unexpected"] = json!(true);
                entries[4].1 = canonical(&m);
            }
            _ => {
                let original = String::from_utf8(entries[4].1.clone()).unwrap();
                entries[4].1 = original
                    .replacen('{', "{\"platform\":\"windows\",", 1)
                    .into_bytes();
            }
        }
        let digest = zip(&path, &entries);
        assert!(archive::native(
            root,
            &path,
            &digest,
            &pin,
            "windows",
            "x86_64",
            Some(&target)
        )
        .is_err());
        assert!(!target.parent().unwrap().exists());
    }
}
#[test]
fn unsafe_portable_names_aliases_and_prefix_collisions_fail_before_writes() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("unsafe.zip");
    let target = dir.path().join("new/extracted");
    for names in [
        vec!["../outside"],
        vec!["a\\outside"],
        vec!["CON.txt"],
        vec!["CON .txt"],
        vec!["COM1 .log"],
        vec!["name."],
        vec!["A", "a"],
        vec!["a", "a/b"],
        vec!["a/b", "a"],
        vec!["C:/outside"],
    ] {
        let entries: Vec<_> = names
            .iter()
            .map(|name| ((*name).into(), b"public".to_vec(), 0o644))
            .collect();
        zip(&path, &entries);
        assert!(release::extract(&path, &target).is_err());
        assert!(!target.parent().unwrap().exists());
    }
}
#[test]
fn late_corruption_and_links_are_rejected_before_any_extraction() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("unsafe.zip");
    let target = dir.path().join("new/extracted");
    zip(
        &path,
        &[
            ("first".into(), b"public".to_vec(), 0o644),
            ("last".into(), b"unique crc payload".to_vec(), 0o644),
        ],
    );
    let mut data = fs::read(&path).unwrap();
    let at = data
        .windows(18)
        .position(|v| v == b"unique crc payload")
        .unwrap();
    data[at] ^= 1;
    fs::write(&path, data).unwrap();
    assert!(release::extract(&path, &target).is_err());
    assert!(!target.parent().unwrap().exists());
    let mut writer = zip::ZipWriter::new(fs::File::create(&path).unwrap());
    writer
        .start_file(
            "first",
            zip::write::SimpleFileOptions::default().system(zip::System::Unix),
        )
        .unwrap();
    writer.write_all(b"public").unwrap();
    writer
        .add_symlink(
            "linked",
            "outside",
            zip::write::SimpleFileOptions::default().system(zip::System::Unix),
        )
        .unwrap();
    writer.finish().unwrap();
    assert!(release::extract(&path, &target).is_err());
    assert!(!target.parent().unwrap().exists());
}
#[test]
fn existing_directories_are_never_updated_or_overwritten() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.zip");
    zip(
        &path,
        &[("sentinel".into(), b"replacement".to_vec(), 0o644)],
    );
    let target = dir.path().join("existing");
    fs::create_dir(&target).unwrap();
    fs::write(target.join("sentinel"), b"original").unwrap();
    assert!(release::extract(&path, &target).is_err());
    assert_eq!(fs::read(target.join("sentinel")).unwrap(), b"original");
}

#[test]
fn archive_resource_metadata_is_bounded_before_output_is_created() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.zip");
    let target = dir.path().join("new/extracted");
    zip(&path, &[("public".into(), b"public".to_vec(), 0o644)]);
    let original = fs::read(&path).unwrap();
    for mutation in 0..5 {
        let mut data = original.clone();
        let central = data.windows(4).position(|v| v == b"PK\x01\x02").unwrap();
        let trailer = data.len() - 22;
        match mutation {
            0 => data[central + 24..central + 28]
                .copy_from_slice(&((MAX_FILE + 1) as u32).to_le_bytes()),
            1 => {
                data[trailer + 8..trailer + 10].copy_from_slice(&4097u16.to_le_bytes());
                data[trailer + 10..trailer + 12].copy_from_slice(&4097u16.to_le_bytes());
            }
            2 => data[trailer + 4] = 1,
            3 => data.push(0),
            _ => {
                // A valid ZIP64 footer can override an ordinary small entry count.
                // Reject it before the dependency can allocate from its metadata.
                let mut footer = vec![0u8; 76];
                footer[..4].copy_from_slice(b"PK\x06\x06");
                footer[4..12].copy_from_slice(&44u64.to_le_bytes());
                footer[12] = 45;
                footer[14] = 45;
                footer[24..32].copy_from_slice(&1u64.to_le_bytes());
                footer[32..40].copy_from_slice(&1u64.to_le_bytes());
                footer[40..48].copy_from_slice(&((trailer - central) as u64).to_le_bytes());
                footer[48..56].copy_from_slice(&(central as u64).to_le_bytes());
                footer[56..60].copy_from_slice(b"PK\x06\x07");
                footer[64..72].copy_from_slice(&(trailer as u64).to_le_bytes());
                footer[72..76].copy_from_slice(&1u32.to_le_bytes());
                data.splice(trailer..trailer, footer);
                assert_eq!(
                    zip::ZipArchive::new(std::io::Cursor::new(&data))
                        .unwrap()
                        .len(),
                    1
                );
            }
        }
        fs::write(&path, data).unwrap();
        assert!(release::extract(&path, &target).is_err());
        assert!(!target.parent().unwrap().exists());
    }
}
