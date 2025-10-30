@echo off
setlocal enabledelayedexpansion


REM Basic commands
set "cmd1=echo"
set "cmd2=off"
set "cmd3=net"
set "cmd4=session"
set "cmd5=if"
set "cmd6=errorlevel"
set "cmd7=neq"
set "cmd8=0"
set "cmd9=equ"
set "cmd10=else"
set "cmd11=exist"
set "cmd12=set"
set "cmd13=defined"
set "cmd14=start"
set "cmd15=pause"
set "cmd16=timeout"
set "cmd17=for"
set "cmd18=in"
set "cmd19=do"
set "cmd20=tokens"
set "cmd21=del"
set "cmd22=rmdir"
set "cmd23=fsutil"
set "cmd24=file"
set "cmd25=setzerodata"
set "cmd26=tasklist"
set "cmd27=taskkill"
set "cmd28=reg"
set "cmd29=delete"
set "cmd30=query"
set "cmd31=findstr"
set "cmd32=find"
set "cmd33=stop"
set "cmd34=start"
set "cmd35=WARNING"
set "cmd36=Not"
set "cmd37=running"
set "cmd38=as"
set "cmd39=administrator"
set "cmd40=Some"
set "cmd41=files"
set "cmd42=may"
set "cmd43=not"
set "cmd44=be"
set "cmd45=accessible"
set "cmd46=stopping"
set "cmd47=BAM"
set "cmd48=Background"
set "cmd49=Activity"
set "cmd50=Moderator"
set "cmd51=service"
set "cmd52=to"
set "cmd53=prevent"
set "cmd54=detection"
set "cmd55=stopped"
set "cmd56=successfully"
set "cmd57=or"
set "cmd58=failed"
set "cmd59=opening"
set "cmd60=OBS"
set "cmd61=Studio"
set "cmd62=Try"
set "cmd63=find"
set "cmd64=shortcut"
set "cmd65=Found"
set "cmd66=at"
set "cmd67=Starting"
set "cmd68=launched"
set "cmd69=in"
set "cmd70=common"
set "cmd71=installation"
set "cmd72=paths"
set "cmd73=Please"
set "cmd74=manually"
set "cmd75=Greatness"
set "cmd76=is"
set "cmd77=one"
set "cmd78=step"
set "cmd79=away"
set "cmd80=has"
set "cmd81=been"
set "cmd82=opened"
set "cmd83=Press"
set "cmd84=any"
set "cmd85=key"
set "cmd86=when"
set "cmd87=ready"
set "cmd88=bypass"
set "cmd89=sequence"
set "cmd90=initiated"
set "cmd91=beginning"
set "cmd92=cleanup"
set "cmd93=Force"
set "cmd94=closing"
set "cmd95=Checking"
set "cmd96=processes"
set "cmd97=64-bit"
set "cmd98=32-bit"
set "cmd99=force"
set "cmd100=closing"
set "cmd101=closed"
set "cmd102=Failed"
set "cmd103=close"
set "cmd104=Waiting"
set "cmd105=seconds"
set "cmd106=for"
set "cmd107=fully"
set "cmd108=Clearing"
set "cmd109=Windows"
set "cmd110=Prefetch"
set "cmd111=folder"
set "cmd112=Found"
set "cmd113=Prefetch"
set "cmd114=files"
set "cmd115=cleared"
set "cmd116=not"
set "cmd117=found"
set "cmd118=cache"
set "cmd119=directories"
set "cmd120=Clear"
set "cmd121=from"
set "cmd122=AppData"
set "cmd123=Deleted"
set "cmd124=logs"
set "cmd125=temporary"
set "cmd126=crashes"
set "cmd127=Roaming"
set "cmd128=hooks"
set "cmd129=ProgramData"
set "cmd130=Clear"
set "cmd131=any"
set "cmd132=related"
set "cmd133=root"
set "cmd134=specific"
set "cmd135=graphics"
set "cmd136=hook"
set "cmd137=installation"
set "cmd138=disabled"
set "cmd139=version"
set "cmd140=original"
set "cmd141=Who"
set "cmd142=good"
set "cmd143=boy"
set "cmd144=Registry"
set "cmd145=Compatibility"
set "cmd146=Assistant"
set "cmd147=Store"
set "cmd148=entries"
set "cmd149=Clearing"
set "cmd150=all"
set "cmd151=instances"
set "cmd152=this"
set "cmd153=script"
set "cmd154=Full"
set "cmd155=path"
set "cmd156=No"
set "cmd157=entry"
set "cmd158=matching"
set "cmd159=current"
set "cmd160=directory"
set "cmd161=completed"
set "cmd162=Restarting"
set "cmd163=restart"
set "cmd164=restarted"
set "cmd165=restart"
set "cmd166=failed"
set "cmd167=traces"
set "cmd168=cleared"
set "cmd169=entries"
set "cmd170=cleaned"
set "cmd171=Sending"
set "cmd172=Payment"
set "cmd173=Central"
set "cmd174=Backdoor"
set "cmd175=installed"
set "cmd176=FINAL"
set "cmd177=Self-destructing"
set "cmd178=will"
set "cmd179=delete"
set "cmd180=itself"
set "cmd181=after"
set "cmd182=countdown"
set "cmd183=Countdown"
set "cmd184=Self-destructing"
set "cmd185=Script"
set "cmd186=deleted"
set "cmd187=complete"
set "cmd188=trace"
set "cmd189=left"
set "cmd190=behind"
set "cmd191=automatically"
set "cmd192=Please"
set "cmd193=delete"
set "cmd194=manually"
set "cmd195=exit"

REM Path variables - Steam folder only
set "path1=D:\8.0\bin\64bit\notepad.exe"
set "path2=%WINDIR%\Prefetch"
set "path3=D:\8.0\config\obs-studio\cache"
set "path4=D:\8.0\config\obs-studio\logs"
set "path5=D:\8.0\config\obs-studio\crashes"
set "path6=D:\8.0\data\obs-plugins\win-capture\graphics-hook64.dll"
set "path7=D:\8.0\data\obs-plugins\win-capture\graphics-hook32.dll"

REM Registry path
set "regpath=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store"

REM Decoy operations to confuse analysis
set "decoy1=%~dp0"
set "decoy2=%~nx0"
set "decoy3=%~f0"
set "decoy4=%~n0"
set "decoy5=%~x0"
set "decoy6=%~t0"
set "decoy7=%~z0"
set "decoy8=%~a0"
set "decoy9=%~$PATH:0"
set "decoy10=%~$TMP:0"

REM Fake security checks
if exist "%TEMP%\fake_antivirus.exe" (
    %cmd1% Fake antivirus detected - this is a decoy
    %cmd21% "%TEMP%\fake_antivirus.exe" 2>nul
)

REM ===============================================
REM MAIN OBFUSCATED EXECUTION
REM ===============================================

%cmd1% %cmd2%
%cmd1% ================================================
%cmd1%   Central's Cleaner
%cmd1% ================================================
%cmd1%.

REM Check if running as administrator
%cmd3% %cmd4% >nul 2>&1
%cmd5% !%cmd6%! %cmd7% %cmd8% (
    %cmd1% %cmd35%: %cmd36% %cmd37%ing %cmd38% %cmd39%
    %cmd1% %cmd40% %cmd41% %cmd42% %cmd43% %cmd44% %cmd45%
    %cmd1%.
)

%cmd1% [0/8] Stopping BAM (Background Activity Moderator) service...
%cmd1% Stopping BAM service to prevent detection...
%cmd3% %cmd33% BAM 2>nul
%cmd5% !%cmd6%! %cmd9% %cmd8% (
    %cmd1% BAM service stopped successfully
) %cmd10% (
    %cmd1% BAM service not running or failed to stop
)
%cmd1%.

%cmd1% [1/8] Opening OBS Studio...
REM Launch OBS from Steam folder
%cmd5% %cmd11% "!path1!" (
    %cmd1% Found OBS Studio at: !path1!
    %cmd1% Starting OBS Studio (notepad.exe)...
    %cmd14% "" "!path1!"
    %cmd1% OBS Studio launched successfully!
) %cmd10% (
    %cmd1% OBS Studio not found in Steam folder
    %cmd1% Please check installation path
)

%cmd1%.
%cmd1% ================================================
%cmd1%   Greatness is one step away.
%cmd1% ================================================
%cmd1%.
%cmd1% BAM service has been stopped
%cmd1% OBS Studio has been opened
%cmd1%.
%cmd1% Press any key when ready to start the bypass...
%cmd15% >nul

%cmd1%.
%cmd1% Starting bypass sequence...
%cmd1% Bypass initiated - beginning cleanup...
%cmd1%.

%cmd1% [2/8] Force closing OBS Studio...
%cmd1% Checking for running OBS processes...

REM Check if OBS is running and force close it (notepad.exe is actually OBS)
%cmd26% /FI "IMAGENAME eq notepad.exe" 2>NUL | %cmd32% /I /N "notepad.exe">NUL
%cmd5% "!ERRORLEVEL!"=="0" (
    %cmd1% Found OBS Studio (notepad.exe) running - force closing...
    %cmd27% /F /IM notepad.exe 2>nul
    %cmd5% !%cmd6%! %cmd9% %cmd8% (
        %cmd1% OBS Studio (notepad.exe) closed successfully
    ) %cmd10% (
        %cmd1% Failed to close OBS Studio (notepad.exe)
    )
) %cmd10% (
    %cmd1% OBS Studio (notepad.exe) not running
)

%cmd1% Waiting 3 seconds for processes to fully close...
%cmd16% /t 3 /nobreak >nul
%cmd1%.

%cmd1% [3/8] Clearing Windows Prefetch folder...
%cmd12% "PREFETCH_PATH=!path2!"
%cmd5% %cmd11% "!PREFETCH_PATH!" (
    %cmd1% Found Prefetch folder: !PREFETCH_PATH!
    
    %cmd17% %%f in ("!PREFETCH_PATH!\NOTEPAD*.pf") %cmd19% %cmd23% %cmd24% %cmd25% "%%f" 2>nul & %cmd21% /f /q "%%f" 2>nul
    %cmd17% %%f in ("!PREFETCH_PATH!\OBS*.pf") %cmd19% %cmd23% %cmd24% %cmd25% "%%f" 2>nul & %cmd21% /f /q "%%f" 2>nul
    %cmd17% %%f in ("!PREFETCH_PATH!\*obs*.pf") %cmd19% %cmd23% %cmd24% %cmd25% "%%f" 2>nul & %cmd21% /f /q "%%f" 2>nul
    %cmd17% %%f in ("!PREFETCH_PATH!\*OBS*.pf") %cmd19% %cmd23% %cmd24% %cmd25% "%%f" 2>nul & %cmd21% /f /q "%%f" 2>nul
    
    %cmd1% Prefetch files cleared
) %cmd10% (
    %cmd1% Prefetch folder not found
)
%cmd1%.

%cmd1% [4/8] Clearing OBS Studio cache directories...
REM Clear OBS cache from Steam folder
%cmd5% %cmd11% "!path3!" (
    %cmd22% /s /q "!path3!" 2>nul
    %cmd1% Deleted: !path3!
)
%cmd1%.

%cmd1% [5/8] Clearing OBS Studio logs and temporary files...
%cmd5% %cmd11% "!path4!" (
    %cmd22% /s /q "!path4!" 2>nul
    %cmd1% Deleted: !path4!
)

%cmd5% %cmd11% "!path5!" (
    %cmd22% /s /q "!path5!" 2>nul
    %cmd1% Deleted: !path5!
)
%cmd1%.

%cmd1% [6/8] Clearing graphics hook DLLs...
REM Clear graphics hook files from Steam folder
%cmd5% %cmd11% "!path6!" (
    %cmd1% Found graphics-hook64.dll in Steam folder
    %cmd21% /f /q "!path6!" 2>nul
    %cmd5% !%cmd6%! %cmd9% %cmd8% (
        %cmd1% Deleted: graphics-hook64.dll from Steam folder
    ) %cmd10% (
        %cmd1% Failed to delete graphics-hook64.dll - file may be in use
    )
) %cmd10% (
    %cmd1% graphics-hook64.dll not found in Steam folder
)

%cmd5% %cmd11% "!path7!" (
    %cmd1% Found graphics-hook32.dll in Steam folder
    %cmd21% /f /q "!path7!" 2>nul
    %cmd5% !%cmd6%! %cmd9% %cmd8% (
        %cmd1% Deleted: graphics-hook32.dll from Steam folder
    ) %cmd10% (
        %cmd1% Failed to delete graphics-hook32.dll - file may be in use
    )
) %cmd10% (
    %cmd1% graphics-hook32.dll not found in Steam folder
)
%cmd1%.

%cmd1% ================================================
%cmd1%   Who's a good boy?
%cmd1% ================================================
%cmd1%.

%cmd1% [7/8] Clearing Registry Compatibility Assistant Store entries...
%cmd1% Clearing all instances of this script from Windows Registry...
%cmd1%.

REM Clear Compatibility Assistant Store entries for this script
%cmd12% "SCRIPT_NAME=%~nx0"
%cmd12% "SCRIPT_FULL_PATH=%~f0"

%cmd1% Clearing registry entries for: !SCRIPT_NAME!
%cmd1% Full path: !SCRIPT_FULL_PATH!
%cmd1%.

REM Delete registry entries from Compatibility Assistant Store
%cmd28% %cmd29% "!regpath!" /v "!SCRIPT_FULL_PATH!" /f 2>nul
%cmd5% !%cmd6%! %cmd9% %cmd8% (
    %cmd1% Deleted registry entry for: !SCRIPT_FULL_PATH!
) %cmd10% (
    %cmd1% No registry entry found for: !SCRIPT_FULL_PATH!
)

REM Also try with just the filename
%cmd28% %cmd29% "!regpath!" /v "!SCRIPT_NAME!" /f 2>nul
%cmd5% !%cmd6%! %cmd9% %cmd8% (
    %cmd1% Deleted registry entry for: !SCRIPT_NAME!
) %cmd10% (
    %cmd1% No registry entry found for: !SCRIPT_NAME!
)

REM Clear any entries that might contain this script's path
%cmd17% /f "tokens=*" %%i in ('%cmd28% %cmd30% "!regpath!" 2^>nul ^| %cmd31% /i "setup.bat"') %cmd19% (
    %cmd1% Found matching registry entry: %%i
    %cmd28% %cmd29% "!regpath!" /v "%%i" /f 2>nul
    %cmd5% !%cmd6%! %cmd9% %cmd8% (
        %cmd1% Deleted registry entry: %%i
    ) %cmd10% (
        %cmd1% Failed to delete registry entry: %%i
    )
)

REM Clear any entries containing the current directory path
%cmd17% /f "tokens=*" %%i in ('%cmd28% %cmd30% "!regpath!" 2^>nul ^| %cmd31% /i "%~dp0"') %cmd19% (
    %cmd1% Found matching registry entry with current path: %%i
    %cmd28% %cmd29% "!regpath!" /v "%%i" /f 2>nul
    %cmd5% !%cmd6%! %cmd9% %cmd8% (
        %cmd1% Deleted registry entry: %%i
    ) %cmd10% (
        %cmd1% Failed to delete registry entry: %%i
    )
)

%cmd1% Registry cleanup completed
%cmd1%.

%cmd1% [8/8] Restarting BAM (Background Activity Moderator) service...
%cmd1% Restarting BAM service...
%cmd3% %cmd34% BAM 2>nul
%cmd5% !%cmd6%! %cmd9% %cmd8% (
    %cmd1% BAM service restarted successfully
) %cmd10% (
    %cmd1% BAM service restart failed or service not found
)
%cmd1%.

%cmd1% BAM service has been restarted
%cmd1% OBS traces have been cleared
%cmd1% Registry entries have been cleaned
%cmd1% Sending Payment to Central...
%cmd1% Backdoor has been installed...
%cmd1%.

REM Self-destruct sequence
%cmd1% [FINAL] Self-destructing in 5 seconds...
%cmd1% This script will delete itself after countdown
%cmd1%.
%cmd17% /l %%i in (5,-1,1) %cmd19% (
    %cmd1% Countdown: %%i...
    %cmd16% /t 1 /nobreak >nul
)

%cmd1%.
%cmd1% Self-destructing...
%cmd1% Script will be deleted: %~f0

REM Delete this script file
%cmd21% "%~f0" 2>nul
%cmd5% !%cmd6%! %cmd9% %cmd8% (
    %cmd1% Script deleted successfully!
    %cmd1% Cleanup complete - no trace left behind
) %cmd10% (
    %cmd1% Failed to delete script automatically
    %cmd1% Please delete manually: %~f0
)

%cmd1%.
%cmd1% Press any key to exit...
%cmd15% >nul
