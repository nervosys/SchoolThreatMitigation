@echo off
setlocal
cd /d "%~dp0.."
call engine\BUILD_WINDOWS.cmd
if errorlevel 1 exit /b 1
if not exist output\native-check mkdir output\native-check
copy /y engine\target\release\stm-tool.exe output\native-check\stm-tool.exe >nul
output\native-check\stm-tool.exe check --root "%CD%" --cargo
exit /b %ERRORLEVEL%
