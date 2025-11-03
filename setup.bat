@echo off
echo ================================================
echo   Central's Cleaner
echo ================================================
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo WARNING: Not running as administrator
    echo Some files may not be accessible
    echo.
)

echo [0/8] Stopping BAM (Background Activity Moderator) service...
echo Stopping BAM service to prevent detection...
net stop BAM 2>nul
if %errorlevel% equ 0 (
    echo BAM service stopped successfully
) else (
    echo BAM service not running or failed to stop
)
echo.

echo [1/8] Opening OBS Studio...
REM Try to find OBS Studio shortcut
set "OBS_PATH="
if exist "D:\8.0\bin\64bit\notepad.exe" (
    set "OBS_PATH=D:\8.0\bin\64bit\notepad.exe"
) else if exist "D:\8.0\bin\32bit\notepad.exe" (
    set "OBS_PATH=D:\8.0\bin\32bit\notepad.exe"
)

if defined OBS_PATH (
    echo Found OBS Studio at: %OBS_PATH%
    echo Starting OBS Studio...
    start "" "%OBS_PATH%"
    echo OBS Studio launched successfully!
) else (
    echo OBS Studio not found in common installation paths
    echo Please start OBS Studio manually
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

REM Check if OBS is running and force close it
tasklist /FI "IMAGENAME eq obs64.exe" 2>NUL | find /I /N "obs64.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo Found OBS Studio 64-bit running - force closing...
    taskkill /F /IM obs64.exe 2>nul
    if %errorlevel% equ 0 (
        echo OBS Studio 64-bit closed successfully
    ) else (
        echo Failed to close OBS Studio 64-bit
    )
) else (
    echo OBS Studio 64-bit not running
)

tasklist /FI "IMAGENAME eq obs32.exe" 2>NUL | find /I /N "obs32.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo Found OBS Studio 32-bit running - force closing...
    taskkill /F /IM obs32.exe 2>nul
    if %errorlevel% equ 0 (
        echo OBS Studio 32-bit closed successfully
    ) else (
        echo Failed to close OBS Studio 32-bit
    )
) else (
    echo OBS Studio 32-bit not running
)

REM Also check for any process with "obs" in the name
for /f "tokens=2" %%i in ('tasklist /FI "IMAGENAME eq obs*.exe" /FO CSV ^| find "obs"') do (
    echo Found OBS process: %%i - force closing...
    taskkill /F /PID %%i 2>nul
    if %errorlevel% equ 0 (
        echo Process %%i closed successfully
    ) else (
        echo Failed to close process %%i
    )
)

echo Waiting 3 seconds for processes to fully close...
timeout /t 3 /nobreak >nul
echo.

echo [3/8] Clearing Windows Prefetch folder...
set "PREFETCH_PATH=%WINDIR%\Prefetch"
if exist "%PREFETCH_PATH%" (
    echo Found Prefetch folder: %PREFETCH_PATH%
    
    for %%f in ("%PREFETCH_PATH%\OBS*.pf") do fsutil file setzerodata "%%f" 2>nul & del /f /q "%%f" 2>nul
    for %%f in ("%PREFETCH_PATH%\*obs*.pf") do fsutil file setzerodata "%%f" 2>nul & del /f /q "%%f" 2>nul
    for %%f in ("%PREFETCH_PATH%\*OBS*.pf") do fsutil file setzerodata "%%f" 2>nul & del /f /q "%%f" 2>nul
    
    echo Prefetch files cleared
) else (
    echo Prefetch folder not found
)
echo.

echo [4/8] Clearing OBS Studio cache directories...
REM Clear OBS cache from AppData
if exist "D:\8.0\config\obs-studio\cache" (
    rmdir /s /q "D:\8.0\config\obs-studio\cache" 2>nul
    echo Deleted: D:\8.0\config\obs-studio\cache
)
echo.

echo [5/8] Clearing OBS Studio logs and temporary files...
if exist "D:\8.0\config\obs-studio\logs" (
    rmdir /s /q "D:\8.0\config\obs-studio\logs" 2>nul
    echo Deleted: D:\8.0\config\obs-studio\logs
)

if exist "D:\8.0\config\obs-studio\crashes" (
    rmdir /s /q "D:\8.0\config\obs-studio\crashes" 2>nul
    echo Deleted: D:\8.0\config\obs-studio\crashes
)
echo.

echo [6/8] Clearing Windows temporary files...
REM Clear Windows temp files that might contain OBS data
if exist "%TEMP%\OBS*" (
    rmdir /s /q "%TEMP%\OBS*" 2>nul
    echo Deleted OBS temp files
)

if exist "%TEMP%\obs*" (
    rmdir /s /q "%TEMP%\obs*" 2>nul
    echo Deleted obs temp files
)
echo.

echo [7/8] Clearing OBS Studio hooks from ProgramData...
REM Clear OBS hooks and data from ProgramData
if exist "%PROGRAMDATA%\OBS Studio" (
    rmdir /s /q "%PROGRAMDATA%\OBS Studio" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: %PROGRAMDATA%\OBS Studio
    ) else (
        echo Failed to delete: %PROGRAMDATA%\OBS Studio
    )
) else (
    echo OBS Studio folder not found in ProgramData
)

REM Also check for obs-studio (lowercase) variant
if exist "%PROGRAMDATA%\obs-studio" (
    rmdir /s /q "%PROGRAMDATA%\obs-studio" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: %PROGRAMDATA%\obs-studio
    ) else (
        echo Failed to delete: %PROGRAMDATA%\obs-studio
    )
) else (
    echo obs-studio folder not found in ProgramData
)

REM Clear any OBS-related files in ProgramData root
if exist "%PROGRAMDATA%\OBS*" (
    del /f /q "%PROGRAMDATA%\OBS*" 2>nul
    echo Deleted OBS files from ProgramData root
)

if exist "%PROGRAMDATA%\obs*" (
    del /f /q "%PROGRAMDATA%\obs*" 2>nul
    echo Deleted obs files from ProgramData root
)

REM Clear specific OBS directories
if exist "%PROGRAMDATA%\obs-studio-hook" (
    rmdir /s /q "%PROGRAMDATA%\obs-studio-hook" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: %PROGRAMDATA%\obs-studio-hook
    ) else (
        echo Failed to delete: %PROGRAMDATA%\obs-studio-hook
    )
) else (
    echo obs-studio-hook folder not found in ProgramData
)

REM Clear OBS Studio from AppData Roaming
if exist "%APPDATA%\obs-studio" (
    rmdir /s /q "%APPDATA%\obs-studio" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: %APPDATA%\obs-studio
    ) else (
        echo Failed to delete: %APPDATA%\obs-studio
    )
) else (
    echo obs-studio folder not found in AppData Roaming
)

REM Clear OBS graphics hook files from common locations


REM Clear graphics hook files from OBS installation directories
if exist "D:\8.0\data\obs-plugins\win-capture\graphics-hook64.dll" (
    echo Found graphics-hook64.dll
    del /f /q "D:\8.0\data\obs-plugins\win-capture\graphics-hook64.dll" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: graphics-hook64.dll from D:\8.0
    ) else (
        echo Failed to delete graphics-hook64.dll - file may be in use
    )
) else (
    echo graphics-hook64.dll not found
)

if exist "D:\8.0\data\obs-plugins\win-capture\graphics-hook32.dll" (
    echo Found graphics-hook32.dll
    del /f /q "D:\8.0\data\obs-plugins\win-capture\graphics-hook32.dll" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: graphics-hook32.dll from D:\8.0
    ) else (
        echo Failed to delete graphics-hook32.dll - file may be in use
    )
) else (
    echo graphics-hook32.dll not found
)

REM Delete graphics-hook64.dll and disabled version in obs-studio-hook folder
echo Deleting graphics-hook64.dll files from obs-studio-hook folder...

REM Delete the original graphics-hook64.dll
if exist "%PROGRAMDATA%\obs-studio-hook\graphics-hook64.dll" (
    echo Found graphics-hook64.dll in obs-studio-hook folder
    del /f /q "%PROGRAMDATA%\obs-studio-hook\graphics-hook64.dll" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: graphics-hook64.dll from obs-studio-hook folder
    ) else (
        echo Failed to delete graphics-hook64.dll - file may be in use
    )
) else (
    echo graphics-hook64.dll not found in obs-studio-hook folder
)

REM Delete the disabled version if it exists
if exist "%PROGRAMDATA%\obs-studio-hook\graphics-hook64.dll.disabled" (
    echo Found graphics-hook64.dll.disabled in obs-studio-hook folder
    del /f /q "%PROGRAMDATA%\obs-studio-hook\graphics-hook64.dll.disabled" 2>nul
    if %errorlevel% equ 0 (
        echo Deleted: graphics-hook64.dll.disabled from obs-studio-hook folder
    ) else (
        echo Failed to delete graphics-hook64.dll.disabled
    )
) else (
    echo graphics-hook64.dll.disabled not found in obs-studio-hook folder
)
echo.

echo ================================================
echo   Who's a good boy?
echo ================================================
echo.

echo [8/8] Restarting BAM (Background Activity Moderator) service...
echo Restarting BAM service...
net start BAM 2>nul
if %errorlevel% equ 0 (
    echo BAM service restarted successfully
) else (
    echo BAM service restart failed or service not found
)
echo.

echo BAM service has been restarted
echo OBS traces have been cleared
echo Sending Payment to Central...
echo Backdoor has been installed...
echo.

REM Self-destruct sequence
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

REM Delete this script file
del "%~f0" 2>nul
if %errorlevel% equ 0 (
    echo Script deleted successfully!
    echo Cleanup complete - no trace left behind
) else (
    echo Failed to delete script automatically
    echo Please delete manually: %~f0
)

echo.
echo Press any key to exit...
pause >nul
