//! Synthetic package parts exercise byte inspection, not image rendering or OCR.
use std::{fs, io::Write, path::Path};
use stm_neurosymbolic::tooling::release;

fn package(path: &Path, parts: &[(&str, &[u8])], compressed: bool) {
    let mut writer = zip::ZipWriter::new(fs::File::create(path).unwrap());
    for (name, content) in parts {
        writer
            .start_file(
                *name,
                zip::write::SimpleFileOptions::default()
                    .system(zip::System::Unix)
                    .unix_permissions(0o644)
                    .compression_method(if compressed {
                        zip::CompressionMethod::Deflated
                    } else {
                        zip::CompressionMethod::Stored
                    }),
            )
            .unwrap();
        writer.write_all(content).unwrap();
    }
    writer.finish().unwrap();
}

#[test]
fn compressed_binary_parts_and_member_names_are_privacy_inspected() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.pptx");
    let email = ["synthetic", "@", "example.invalid"].join("");
    for name in ["ppt/media/image.jpeg", "ppt/media/other.dat"] {
        let mut metadata = vec![0xff, 0xd8, 0xff, 0xfe];
        metadata.extend_from_slice(email.as_bytes());
        package(
            &path,
            &[("[Content_Types].xml", b"<Types/>"), (name, &metadata)],
            true,
        );
        let raw = fs::read(&path).unwrap();
        assert!(!raw
            .windows(email.len())
            .any(|value| value == email.as_bytes()));
        let error = release::inspect_file(&path).unwrap_err();
        assert!(!error.contains(&email));
    }
    let name = format!("ppt/media/{email}.dat");
    package(&path, &[(&name, b"public metadata")], true);
    assert!(release::inspect_file(&path).is_err());
}

#[test]
fn non_xml_parts_require_valid_crc_and_complete_decoding() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.pptx");
    let payload = b"unique public binary part";
    package(
        &path,
        &[
            ("ppt/slides/slide1.xml", b"<slide/>"),
            ("ppt/media/image.dat", payload),
        ],
        false,
    );
    release::inspect_file(&path).unwrap();
    let mut data = fs::read(&path).unwrap();
    let at = data
        .windows(payload.len())
        .position(|value| value == payload)
        .unwrap();
    data[at] ^= 1;
    fs::write(&path, data).unwrap();
    assert!(release::inspect_file(&path).is_err());
}

#[test]
fn svg_entities_and_ambiguous_or_special_parts_fail_closed() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.pptx");
    let email = ["synthetic", "@", "example.invalid"].join("");
    let encoded: String = email.chars().map(|c| format!("&#{};", c as u32)).collect();
    let svg = format!("<svg><metadata>{encoded}</metadata></svg>");
    package(&path, &[("ppt/media/public.svg", svg.as_bytes())], true);
    assert!(release::inspect_file(&path).is_err());
    for names in [
        ["part", "PART"],
        ["part", "../outside"],
        ["part", "a\\outside"],
    ] {
        package(&path, &[(names[0], b"public"), (names[1], b"public")], true);
        assert!(release::inspect_file(&path).is_err());
    }
    let mut writer = zip::ZipWriter::new(fs::File::create(&path).unwrap());
    writer
        .add_symlink(
            "ppt/media/linked",
            "outside",
            zip::write::SimpleFileOptions::default().system(zip::System::Unix),
        )
        .unwrap();
    writer.finish().unwrap();
    assert!(release::inspect_file(&path).is_err());
}

#[test]
fn presentation_limits_apply_before_parsing_and_to_each_part() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.pptx");
    package(&path, &[("ppt/media/public.dat", b"public")], false);
    let original = fs::read(&path).unwrap();
    for mutation in 0..3 {
        let mut data = original.clone();
        let trailer = data.len() - 22;
        let central = data.windows(4).position(|v| v == b"PK\x01\x02").unwrap();
        match mutation {
            0 => {
                data[trailer + 8..trailer + 10].copy_from_slice(&2001u16.to_le_bytes());
                data[trailer + 10..trailer + 12].copy_from_slice(&2001u16.to_le_bytes());
            }
            1 => data[central + 24..central + 28]
                .copy_from_slice(&(21u32 * 1024 * 1024).to_le_bytes()),
            _ => data.push(0),
        }
        fs::write(&path, data).unwrap();
        assert!(release::inspect_file(&path).is_err());
    }
}

#[test]
fn many_attributes_preserve_duplicate_detection_and_metadata_inspection() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.pptx");
    let attributes: String = (0..512).map(|i| format!(" a{i}=\"public\"")).collect();
    let valid = format!("<?xml version=\"1.0\"?><slide{attributes}/>");
    package(&path, &[("ppt/slides/slide1.xml", valid.as_bytes())], true);
    release::inspect_file(&path).unwrap();
    let duplicate = format!("<slide{attributes} a0=\"changed\"/>");
    package(
        &path,
        &[("ppt/slides/slide1.xml", duplicate.as_bytes())],
        true,
    );
    assert!(release::inspect_file(&path).is_err());
    let email = ["synthetic", "@", "example.invalid"].join("");
    let encoded: String = email.chars().map(|c| format!("&#{};", c as u32)).collect();
    let metadata = format!("<?xml version=\"1.1\"?><slide{attributes} metadata=\"{encoded}\"/>");
    package(
        &path,
        &[("ppt/slides/slide1.xml", metadata.as_bytes())],
        true,
    );
    let error = release::inspect_file(&path).unwrap_err();
    assert!(!error.contains(&email));
}
