# WA School Safety — Kokoro TTS (uv edition)

This package contains all 10 original scene PNGs, the Version 14.5 source narration, and a **single PEP 723 Python script** that generates a genuine Kokoro-82M voiceover and a subtitled H.264 MP4. No separate `requirements.txt` or virtual environment setup is necessary; **uv** manages the script's Python dependencies.

## Windows 10/11 — first-time setup

1. Install `uv`: `winget install --id=astral-sh.uv -e` (then restart PowerShell).
2. Install **FFmpeg** and add its `bin` folder to PATH: https://ffmpeg.org/download.html . Check `ffmpeg -version` and `ffprobe -version`.
3. Install **eSpeak NG** from https://github.com/espeak-ng/espeak-ng/releases (Windows MSI). Restart PowerShell; where available, `espeak-ng --version` should work.
4. Extract the whole ZIP to a folder, then open **PowerShell** in that folder.
5. Run:

   ```powershell
   uv run --python 3.12 .\kokoro_uv_render.py --check
   uv run --python 3.12 .\kokoro_uv_render.py
   ```

The second command uses voice `am_michael` (American-English male) at 0.92× narration speed. The first time, `uv` downloads Python packages, and Kokoro downloads `hexgrad/Kokoro-82M` model weights/voice from Hugging Face. Internet access is required initially.

The following are produced in `output/`:
- `WA_School_Safety_Kokoro_am_michael_v14_6.mp4` (1280×720, AAC audio, selectable English captions)
- `Kokoro_Narration_am_michael_v14_6.wav` (48 kHz stereo)
- `Kokoro_Captions_am_michael_v14_6.srt`
- `production_metadata.json`

Alternatively, double-click `RUN_ON_WINDOWS_UV.cmd` after installing the prerequisites.

## Run against the *earlier* project ZIP without extracting it

```powershell
uv run --python 3.12 .\kokoro_uv_render.py --project .\WA_School_Safety_Kokoro_Render_Ready_VERSION_14_6.zip
```

The older ZIP is automatically extracted to a temporary folder, and the output is saved in an `output/` folder next to the ZIP.

## Variants

```powershell
uv run --python 3.12 .\kokoro_uv_render.py --voice am_fenrir --speed 0.95
uv run --python 3.12 .\kokoro_uv_render.py --no-music
uv run --python 3.12 .\kokoro_uv_render.py --output-dir .\rendered
```

## Linux

Install `ffmpeg` and `espeak-ng` with your distro package manager, install uv (https://docs.astral.sh/uv/getting-started/installation/), then run `uv run --python 3.12 kokoro_uv_render.py` from the extracted folder.

## Verification status

- Python syntax, extraction from ZIP, and `--check` were validated.
- End-to-end FFmpeg scene/caption/mux and duration checks were validated with a temporary **mock audio generator**. That test output is not included, and is **not** Kokoro.
- Actual Kokoro synthesis has NOT run in the restricted authoring environment. The user must run this script with network/model access.
- The original substantive wording and visual scenes are unchanged.

License notice: Kokoro upstream model and software are Apache 2.0. https://github.com/hexgrad/kokoro
