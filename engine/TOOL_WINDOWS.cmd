@echo off
setlocal
if not exist "%~dp0target\release\stm-tool.exe" (
  echo Build once with engine\BUILD_WINDOWS.cmd. 1>&2
  exit /b 1
)
"%~dp0target\release\stm-tool.exe" %*
exit /b %ERRORLEVEL%
