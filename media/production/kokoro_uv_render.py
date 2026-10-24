#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10,<3.14"
# dependencies = [
#   "kokoro==0.9.4",
#   "numpy>=1.26,<3",
#   "scipy>=1.13,<2",
#   "soundfile>=0.12,<1",
# ]
# ///
"""Render the WA School Safety briefing using genuine Kokoro-82M narration.

Quick start (Python deps installed automatically by uv):
    uv run --python 3.12 kokoro_uv_render.py --check
    uv run --python 3.12 kokoro_uv_render.py

You may also point to the original project ZIP:
    uv run --python 3.12 kokoro_uv_render.py --project WA_School_Safety_Kokoro_Render_Ready_VERSION_14_6.zip

Prerequisites installed separately: FFmpeg (ffmpeg and preferably ffprobe), eSpeak NG,
and Internet access on the first run for Kokoro-82M model/voice downloads.
The 10 scene PNG files and markdown transcript are NOT synthesized or fetched from the web;
they are expected alongside this script, or inside --project directory/ZIP.
"""
from __future__ import annotations

import argparse
from contextlib import contextmanager
import importlib.util
import json
import math
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import textwrap
import zipfile

ROOT = Path(__file__).resolve().parent
MODEL_RATE = 24000
AUDIO_RATE = 48000
FPS = 24
LEAD = 0.72
TRAIL = 1.45
GAP = 0.18
TRANSCRIPT_NAME = "Source_Narration_Transcript_VERSION_14_5.md"
VOICES = ("am_michael", "am_fenrir", "am_adam", "am_onyx", "am_echo", "am_eric", "am_liam")


def fail(message: str):
    raise SystemExit(f"ERROR: {message}")


def execute(args: list[str]):
    try:
        subprocess.run(args, check=True)
    except FileNotFoundError as exc:
        fail(f"Missing required executable: {args[0]}. ({exc})")
    except subprocess.CalledProcessError as exc:
        fail(f"Command failed with exit status {exc.returncode}: {args[0]}")


@contextmanager
def project_context(spec: Path):
    if not spec.is_file() or spec.suffix.lower() != ".zip":
        if not spec.is_dir():
            fail(f"Project not found: {spec}")
        yield find_project(spec)
        return
    with tempfile.TemporaryDirectory(prefix="wa_kokoro_") as temp:
        dest = Path(temp)
        with zipfile.ZipFile(spec) as archive:
            for entry in archive.infolist():
                target = (dest / entry.filename).resolve()
                if not target.is_relative_to(dest.resolve()):
                    fail("Unsafe ZIP member path; refusing to extract project.")
            archive.extractall(dest)
        yield find_project(dest)


def find_project(base: Path) -> Path:
    if (base / "scenes" / "00.png").exists() and (base / TRANSCRIPT_NAME).is_file():
        return base
    candidates = [p.parent for p in base.rglob(TRANSCRIPT_NAME)
                  if (p.parent / "scenes" / "00.png").exists()]
    if len(candidates) != 1:
        fail(f"Expected exactly one project with scenes/00.png and {TRANSCRIPT_NAME} in {base}; found {len(candidates)}")
    return candidates[0]


def parse_scenes(text: str) -> list[dict]:
    headings = list(re.finditer(r"^##\s+(\d{2})\s+[—–-]\s+(.+?)\s*$", text, re.M))
    scenes = []
    for i, head in enumerate(headings):
        stop = headings[i + 1].start() if i + 1 < len(headings) else len(text)
        paragraph = text[head.end():stop].strip()
        sentences = [s.strip() for s in re.split(r"(?<=[.!?])\s+", paragraph) if s.strip()]
        scenes.append({"number": int(head.group(1)), "title": head.group(2),
                       "sentences": sentences})
    if [x["number"] for x in scenes] != list(range(10)):
        fail("Expected transcript sections numbered 00 through 09.")
    if any(not x["sentences"] for x in scenes):
        fail("One or more scenes have no narration.")
    return scenes


def srt_time(seconds: float) -> str:
    ms = max(0, round(seconds * 1000))
    hours, rem = divmod(ms, 3_600_000)
    minutes, rem = divmod(rem, 60_000)
    secs, ms = divmod(rem, 1000)
    return f"{hours:02}:{minutes:02}:{secs:02},{ms:03}"


def srt_text(captions: list[tuple[float, float, str]]) -> str:
    blocks = []
    for i, (start, end, phrase) in enumerate(captions, 1):
        wrapped = "\n".join(textwrap.wrap(phrase, 56, break_long_words=False,
                                           break_on_hyphens=False))
        blocks.append(f"{i}\n{srt_time(start)} --> {srt_time(end)}\n{wrapped}\n")
    return "\n".join(blocks) + "\n"


def synthesize_sentence(pipeline, phrase: str, voice: str, speed: float):
    import numpy as np
    pieces = []
    try:
        for _, _, audio in pipeline(phrase, voice=voice, speed=speed):
            if hasattr(audio, "detach"):
                audio = audio.detach().cpu().numpy()
            data = np.asarray(audio, dtype=np.float32).reshape(-1)
            if data.size:
                pieces.append(data)
    except Exception as exc:
        fail(f"Kokoro synthesis failed for {phrase!r}: {exc}")
    if not pieces:
        fail(f"Kokoro produced no audio for {phrase!r}.")
    inner_pause = np.zeros(round(.025 * MODEL_RATE), dtype=np.float32)
    audio = np.concatenate([v for i, part in enumerate(pieces)
                            for v in (([inner_pause] if i else []) + [part])])
    peak = max(.1, float(np.max(np.abs(audio))))
    audio = np.clip(audio * (.82 / peak), -.94, .94)
    # Smooth boundaries to minimize clicks at sentence joins.
    fade_n = min(round(.006 * MODEL_RATE), len(audio) // 3)
    if fade_n:
        fade = np.linspace(0, 1, fade_n, dtype=np.float32)
        audio[:fade_n] *= fade
        audio[-fade_n:] *= fade[::-1]
    return audio.astype(np.float32)


def make_music(size: int):
    import numpy as np
    # Very low-volume synthesized backing bed; voice is primary.
    bed = np.zeros(size, dtype=np.float32)
    chords = [(130.81, 164.81, 196), (138.59, 174.61, 207.65),
              (155.56, 196, 233.08), (116.54, 146.83, 174.61)]
    seconds_per_chord = 14.0
    for idx in range(math.ceil(size / (AUDIO_RATE * seconds_per_chord))):
        a = round(idx * seconds_per_chord * AUDIO_RATE)
        b = min(size, round((idx + 1) * seconds_per_chord * AUDIO_RATE))
        if a >= b:
            break
        t = np.arange(b - a, dtype=np.float32) / AUDIO_RATE
        release = (b - a) / AUDIO_RATE - t
        envelope = np.minimum(1, t / 1.8) * np.minimum(1, release / 1.8)
        signal = sum(np.sin(2 * np.pi * f * t) + .12 * np.sin(4 * np.pi * f * t)
                     for f in chords[idx % len(chords)]) / 3
        bed[a:b] = .017 * envelope * signal
    return bed


def make_video(project: Path, scene_timing: list[dict], tmp: Path, threads: int):
    clips = tmp / "clips"
    clips.mkdir(parents=True, exist_ok=True)
    # Each scene's frame count is derived from rounded cumulative timings, minimizing subtitle drift.
    for i, scene in enumerate(scene_timing):
        start = round(scene["start"] * FPS)
        end = round((scene["start"] + scene["duration"]) * FPS)
        count = max(12, end - start)
        actual = count / FPS
        out = clips / f"{i:02}.mp4"
        fade_out = max(.25, actual - .26)
        vf = f"fade=t=in:st=0:d=0.20,fade=t=out:st={fade_out:.4f}:d=0.22,format=yuv420p"
        execute(["ffmpeg", "-hide_banner", "-loglevel", "error", "-y", "-loop", "1",
                 "-framerate", str(FPS), "-i", str(project / "scenes" / f"{i:02}.png"),
                 "-frames:v", str(count), "-vf", vf, "-c:v", "libx264",
                 "-threads", str(threads), "-preset", "veryfast", "-crf", "22",
                 "-pix_fmt", "yuv420p", "-an", str(out)])
        print(f"  Video scene {i + 1}/10 encoded", flush=True)
    concat = clips / "concat.txt"
    concat.write_text("".join(f"file '{i:02}.mp4'\n" for i in range(len(scene_timing))),
                      encoding="utf-8")
    out = tmp / "video_only.mp4"
    execute(["ffmpeg", "-hide_banner", "-loglevel", "error", "-y", "-f", "concat",
             "-safe", "0", "-i", str(concat), "-c:v", "copy", "-an", str(out)])
    return out


def render(project: Path, output: Path, scenes: list[dict], voice: str, speed: float,
           no_music: bool, threads: int):
    import numpy as np
    import soundfile as sf
    from scipy.signal import resample_poly
    from kokoro import KPipeline

    try:
        pipeline = KPipeline(lang_code="a")
    except Exception as exc:
        fail("Could not initialize Kokoro (requires model access and eSpeak NG). "
             f"Cause: {exc}")
    output.mkdir(parents=True, exist_ok=True)
    sequence = []
    captions = []
    timings = []
    elapsed_samples = 0
    for i, sc in enumerate(scenes):
        voice_bits = []
        slide_start = elapsed_samples / AUDIO_RATE
        narration_cursor = slide_start + LEAD
        for sentence in sc["sentences"]:
            sample24 = synthesize_sentence(pipeline, sentence, voice, speed)
            sample48 = resample_poly(sample24, 2, 1).astype(np.float32)
            captions.append((narration_cursor, narration_cursor + len(sample48) / AUDIO_RATE, sentence))
            voice_bits.append(sample48)
            narration_cursor += (len(sample48) / AUDIO_RATE) + GAP
        pause = np.zeros(round(GAP * AUDIO_RATE), dtype=np.float32)
        grouped = np.concatenate([part for idx, sound in enumerate(voice_bits)
                                  for part in (([pause] if idx else []) + [sound])])
        samples = round(LEAD * AUDIO_RATE) + len(grouped) + round(TRAIL * AUDIO_RATE)
        segment = np.zeros(samples, dtype=np.float32)
        offset = round(LEAD * AUDIO_RATE)
        segment[offset:offset + len(grouped)] = grouped
        sequence.append(segment)
        timings.append({"scene": i, "title": sc["title"],
                        "start": round(slide_start, 5), "duration": round(samples / AUDIO_RATE, 5)})
        elapsed_samples += samples
        print(f"  Kokoro scene {i + 1}/10: {samples / AUDIO_RATE:.1f}s", flush=True)
    spoken = np.concatenate(sequence)
    music = np.zeros_like(spoken) if no_music else make_music(len(spoken))
    envelope = np.minimum(1, np.arange(len(spoken), dtype=np.float32) / (AUDIO_RATE * .5))
    envelope *= np.minimum(1, (len(spoken) - np.arange(len(spoken), dtype=np.float32)) /
                           (AUDIO_RATE * .7))
    main = np.clip((spoken + music) * envelope, -.98, .98)
    stereo = np.stack((main + .06 * music, main - .06 * music), axis=1)

    wav = output / f"Kokoro_Narration_{voice}_v14_6.wav"
    srt = output / f"Kokoro_Captions_{voice}_v14_6.srt"
    mp4 = output / f"WA_School_Safety_Kokoro_{voice}_v14_6.mp4"
    sf.write(wav, stereo, AUDIO_RATE, subtype="PCM_16")
    srt.write_text(srt_text(captions), encoding="utf-8")

    with tempfile.TemporaryDirectory(prefix="wa_video_") as work:
        silent = make_video(project, timings, Path(work), threads)
        execute(["ffmpeg", "-hide_banner", "-loglevel", "error", "-y",
                 "-i", str(silent), "-i", str(wav), "-i", str(srt),
                 "-map", "0:v:0", "-map", "1:a:0", "-map", "2:s:0",
                 "-c:v", "copy", "-c:a", "aac", "-b:a", "160k",
                 "-c:s", "mov_text", "-metadata:s:s:0", "language=eng",
                 "-movflags", "+faststart", "-t", f"{len(spoken) / AUDIO_RATE:.5f}", str(mp4)])

    metadata = {"voice": voice, "tts_model": "hexgrad/Kokoro-82M",
                "speed": speed, "video": str(mp4), "narration_wav": str(wav),
                "captions_srt": str(srt), "scene_timing": timings,
                "duration_seconds": len(spoken) / AUDIO_RATE}
    (output / "production_metadata.json").write_text(json.dumps(metadata, indent=2),
                                                         encoding="utf-8")
    if shutil.which("ffprobe"):
        probe = subprocess.run(["ffprobe", "-v", "error", "-show_entries",
                                "format=duration", "-of", "default=noprint_wrappers=1:nokey=1",
                                str(mp4)], capture_output=True, text=True)
        if probe.returncode == 0:
            duration = float(probe.stdout.strip())
            if abs(duration - len(spoken) / AUDIO_RATE) > .75:
                fail(f"Rendered video duration mismatch: {duration:.2f}s vs narration "
                     f"{len(spoken) / AUDIO_RATE:.2f}s")
            print(f"  Verified video duration: {duration:.1f}s", flush=True)
    print("\nDONE\n" + "\n".join(f"{name}: {path}" for name, path in
                                   [("MP4", mp4), ("WAV", wav), ("Captions", srt)]), flush=True)


def main():
    p = argparse.ArgumentParser(description="Kokoro TTS for WA School Safety briefing (uv/Windows ready)")
    p.add_argument("--project", type=Path, default=ROOT,
                   help="Directory or original VERSION_14_6 project ZIP; defaults to script folder")
    p.add_argument("--output-dir", type=Path, default=None,
                   help="Folder for rendered MP4/WAV/SRT (default: ./output beside project)")
    p.add_argument("--voice", choices=VOICES, default="am_michael")
    p.add_argument("--speed", type=float, default=.92)
    p.add_argument("--threads", type=int, default=2, help="FFmpeg encoding threads per scene")
    p.add_argument("--no-music", action="store_true")
    p.add_argument("--check", action="store_true", help="Validate assets; do not load Kokoro model")
    args = p.parse_args()
    if not .75 <= args.speed <= 1.2:
        fail("--speed must be between 0.75 and 1.2")
    if not 1 <= args.threads <= 16:
        fail("--threads must be between 1 and 16")
    src = args.project.expanduser().resolve()
    with project_context(src) as project:
        scenes = parse_scenes((project / TRANSCRIPT_NAME).read_text(encoding="utf-8"))
        for scene in scenes:
            path = project / "scenes" / f"{scene['number']:02}.png"
            if not path.is_file():
                fail(f"Missing required scene PNG: {path}")
        info = {"project": str(src), "scenes": len(scenes),
                "sentences": sum(len(s["sentences"]) for s in scenes),
                "voice": args.voice, "speed": args.speed,
                "ffmpeg_found": bool(shutil.which("ffmpeg")),
                "ffprobe_found": bool(shutil.which("ffprobe")),
                "espeak_ng_found_on_PATH": bool(shutil.which("espeak-ng")),
                "kokoro_installed_in_current_python": importlib.util.find_spec("kokoro") is not None}
        if args.check:
            print(json.dumps(info, indent=2))
            if not info["ffmpeg_found"]:
                print("NOTE: Install FFmpeg before rendering.", file=sys.stderr)
            if not info["espeak_ng_found_on_PATH"]:
                print("NOTE: eSpeak NG may need installing/adding to PATH.", file=sys.stderr)
            return
        if not info["ffmpeg_found"]:
            fail("FFmpeg missing. Install FFmpeg, restart terminal, verify: ffmpeg -version")
        if not info["espeak_ng_found_on_PATH"]:
            print("WARNING: eSpeak NG executable was not found on PATH. Some installations "
                  "may still expose its library to Kokoro; if initialization fails, install eSpeak NG.",
                  file=sys.stderr)
        # If --project references a ZIP, its extracted temp folder disappears after this call.
        target = args.output_dir.expanduser().resolve() if args.output_dir else (
            (src.parent if src.is_file() else src) / "output")
        print(f"Rendering genuine Kokoro narration ({args.voice}, {args.speed}x)...", flush=True)
        render(project, target, scenes, args.voice, args.speed, args.no_music, args.threads)


if __name__ == "__main__":
    main()
