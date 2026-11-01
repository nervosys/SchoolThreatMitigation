@echo off
setlocal
REM stdout is reserved for MCP JSON-RPC. Build separately with BUILD_WINDOWS.cmd.
if not exist "%~dp0target\release\stm-neurosymbolic.exe" (
  echo Build once with engine\BUILD_WINDOWS.cmd before running. 1>&2
  exit /b 1
)
"%~dp0target\release\stm-neurosymbolic.exe" mcp
exit /b %ERRORLEVEL%
