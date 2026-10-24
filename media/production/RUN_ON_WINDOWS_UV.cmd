@echo off
setlocal EnableExtensions
REM Windows launcher fix: do NOT pass "%~dp0" as a quoted CLI argument.
REM %~dp0 ends in a backslash; Windows command-line argument parsing can
REM interpret its closing quote as part of the argument.
cd /d "%~dp0"
if errorlevel 1 (
    echo ERROR: Cannot open the script folder.
    pause
    exit /b 1
)
where uv >nul 2>nul
if errorlevel 1 (
    echo ERROR: uv not installed. Run: winget install --id=astral-sh.uv -e
    pause
    exit /b 1
)
where ffmpeg >nul 2>nul
if errorlevel 1 (
    echo ERROR: FFmpeg not found on PATH.
    pause
    exit /b 1
)
REM The Python script defaults --project to its own directory.
uv run --python 3.12 "%~dp0kokoro_uv_render.py"
set "EXIT_CODE=%ERRORLEVEL%"
echo.
if not "%EXIT_CODE%"=="0" (
    echo Render failed; read the error above, and check eSpeak NG and Internet access.
) else (
    echo Render complete. Check the output folder.
)
pause
exit /b %EXIT_CODE%
