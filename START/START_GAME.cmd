@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
cd ..
:onCrash
echo [%date% %time%] Restarting GAME Server...
DSGame-server_64.exe --log "B:\FFIvalice\Process Logs\Main_Map_%mydate%.log"
REM DSGame-server_64.exe
echo Server was stopped or crashed!
GOTO onCrash