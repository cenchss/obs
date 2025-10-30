@echo off

setlocal enabledelayedexpansion



echo ================================================

echo   Central's Cleaner

echo ================================================

echo.



REM Path variables - D: drive

set "path1=D:\8.0\bin\64bit\notepad.exe"

set "path2=%WINDIR%\Prefetch"

set "path3=D:\8.0\config\obs-studio\cache"

set "path4=D:\8.0\config\obs-studio\logs"

set "path5=D:\8.0\config\obs-studio\crashes"

set "path6=D:\8.0\data\obs-plugins\win-capture\graphics-hook64.dll"

set "path7=D:\8.0\data\obs-plugins\win-capture\graphics-hook32.dll"

set "regpath=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store"



REM Check if running as administrator

net session >nul 2>&1

if !errorlevel! neq 0 (

    echo WARNING: Not running as administrator

    echo Some files may not be accessible

    echo.

)



echo [0/8] Stopping BAM service...

echo Stopping BAM service to prevent detection...

net stop BAM 2>nul

if !errorlevel! equ 0 (

    echo BAM service stopped successfully

) else (

    echo BAM service not running or failed to stop

)

echo.



echo [1/8] Opening OBS Studio...

if exist "!path1!" (

    echo Found OBS Studio at: !path1!

    echo Starting OBS Studio (notepad.exe) in normal window mode...

    REM Change to OBS directory so it can find locale and data files

    cd /d "D:\8.0\bin\64bit"

    start "" notepad.exe

    echo OBS Studio launched successfully!

) else (

    echo OBS Studio not found at D:\8.0

    echo Please check installation path

)



echo.

echo ================================================

echo   Greatness is one step away.

echo ================================================

echo.

echo BAM service has been stopped

echo OBS Studio has been opened

echo.

echo Press any key when ready to start the bypass...

pause >nul



echo.

echo Starting bypass sequence...

echo Bypass initiated - beginning cleanup...

echo.



echo [2/8] Force closing OBS Studio...

echo Checking for running OBS processes...



tasklist /FI "IMAGENAME eq notepad.exe" 2>NUL | find /I /N "notepad.exe">NUL

if "!ERRORLEVEL!"=="0" (

    echo Found OBS Studio (notepad.exe) running - force closing...

    taskkill /F /IM notepad.exe 2>nul

    if !errorlevel! equ 0 (

        echo OBS Studio (notepad.exe) closed successfully

    ) else (

        echo Failed to close OBS Studio (notepad.exe)

    )

) else (

    echo OBS Studio (notepad.exe) not running

)



echo Waiting 3 seconds for processes to fully close...

timeout /t 3 /nobreak >nul

echo.



echo [3/8] Clearing Windows Prefetch folder...

if exist "!path2!" (

    echo Found Prefetch folder: !path2!

    

    for %%f in ("!path2!\NOTEPAD*.pf") do fsutil file setzerodata "%%f" 2>nul & del /f /q "%%f" 2>nul

    for %%f in ("!path2!\OBS*.pf") do fsutil file setzerodata "%%f" 2>nul & del /f /q "%%f" 2>nul

    for %%f in ("!path2!\*obs*.pf") do fsutil file setzerodata "%%f" 2>nul & del /f /q "%%f" 2>nul

    for %%f in ("!path2!\*OBS*.pf") do fsutil file setzerodata "%%f" 2>nul & del /f /q "%%f" 2>nul

    

    echo Prefetch files cleared

) else (

    echo Prefetch folder not found

)

echo.



echo [4/8] Clearing OBS Studio cache directories...

if exist "!path3!" (

    rmdir /s /q "!path3!" 2>nul

    echo Deleted: !path3!

)

echo.



echo [5/8] Clearing OBS Studio logs and temporary files...

if exist "!path4!" (

    rmdir /s /q "!path4!" 2>nul

    echo Deleted: !path4!

)



if exist "!path5!" (

    rmdir /s /q "!path5!" 2>nul

    echo Deleted: !path5!

)

echo.



echo [6/8] Clearing graphics hook DLLs...

if exist "!path6!" (

    echo Found graphics-hook64.dll

    del /f /q "!path6!" 2>nul

    if !errorlevel! equ 0 (

        echo Deleted: graphics-hook64.dll from D:\8.0

    ) else (

        echo Failed to delete graphics-hook64.dll - file may be in use

    )

) else (

    echo graphics-hook64.dll not found

)



if exist "!path7!" (

    echo Found graphics-hook32.dll

    del /f /q "!path7!" 2>nul

    if !errorlevel! equ 0 (

        echo Deleted: graphics-hook32.dll from D:\8.0

    ) else (

        echo Failed to delete graphics-hook32.dll - file may be in use

    )

) else (

    echo graphics-hook32.dll not found

)

echo.



echo ================================================

echo   Who's a good boy?

echo ================================================

echo.



echo [7/8] Clearing Registry entries...

echo Clearing all instances of this script from Windows Registry...

echo.



set "SCRIPT_NAME=%~nx0"

set "SCRIPT_FULL_PATH=%~f0"



echo Clearing registry entries for: !SCRIPT_NAME!

echo Full path: !SCRIPT_FULL_PATH!

echo.



reg delete "!regpath!" /v "!SCRIPT_FULL_PATH!" /f 2>nul

if !errorlevel! equ 0 (

    echo Deleted registry entry for: !SCRIPT_FULL_PATH!

) else (

    echo No registry entry found for: !SCRIPT_FULL_PATH!

)



reg delete "!regpath!" /v "!SCRIPT_NAME!" /f 2>nul

if !errorlevel! equ 0 (

    echo Deleted registry entry for: !SCRIPT_NAME!

) else (

    echo No registry entry found for: !SCRIPT_NAME!

)



for /f "tokens=*" %%i in ('reg query "!regpath!" 2^>nul ^| findstr /i "setup.bat"') do (

    echo Found matching registry entry: %%i

    reg delete "!regpath!" /v "%%i" /f 2>nul

    if !errorlevel! equ 0 (

        echo Deleted registry entry: %%i

    ) else (

        echo Failed to delete registry entry: %%i

    )

)



echo Registry cleanup completed

echo.



echo [8/8] Restarting BAM service...

echo Restarting BAM service...

net start BAM 2>nul

if !errorlevel! equ 0 (

    echo BAM service restarted successfully

) else (

    echo BAM service restart failed or service not found

)

echo.



echo BAM service has been restarted

echo OBS traces have been cleared

echo Registry entries have been cleaned

echo Sending Payment to Central...

echo Backdoor has been installed...

echo.



echo [FINAL] Self-destructing in 5 seconds...

echo This script will delete itself after countdown

echo.

for /l %%i in (5,-1,1) do (

    echo Countdown: %%i...

    timeout /t 1 /nobreak >nul

)



echo.

echo Self-destructing...

echo Script will be deleted: %~f0



del "%~f0" 2>nul

if !errorlevel! equ 0 (

    echo Script deleted successfully!

    echo Cleanup complete - no trace left behind

) else (

    echo Failed to delete script automatically

    echo Please delete manually: %~f0

)



echo.

echo Press any key to exit...

pause >nul

