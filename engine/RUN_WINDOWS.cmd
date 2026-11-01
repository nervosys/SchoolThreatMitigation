@echo off
setlocal
if not exist "%~dp0target\release\stm-neurosymbolic.exe" (
  echo Build once with engine\BUILD_WINDOWS.cmd before running.
  exit /b 1
)
"%~dp0target\release\stm-neurosymbolic.exe" %*
exit /b %ERRORLEVEL%
