@echo off
title SHUFFLE NET TWEAKER
chcp 65001 >nul
color 0d
mode con: cols=120 lines=40

cls
echo ░██████╗██╗░░██╗██╗░░░██╗███████╗███████╗██╗░░░░░███████╗███╗░░██╗███████╗████████╗
echo ██╔════╝██║░░██║██║░░░██║██╔════╝██╔════╝██║░░░░░██╔════╝████╗░██║██╔════╝╚══██╔══╝
echo ╚█████╗░███████║██║░░░██║█████╗░░█████╗░░██║░░░░░█████╗░░██╔██╗██║█████╗░░░░░██║░░░
echo ░╚═══██╗██╔══██║██║░░░██║██╔══╝░░██╔══╝░░██║░░░░░██╔══╝░░██║╚████║██╔══╝░░░░░██║░░░
echo ██████╔╝██║░░██║╚██████╔╝██║░░░░░██║░░░░░███████╗███████╗██║░╚███║███████╗░░░██║░░░
echo ╚═════╝░╚═╝░░╚═╝░╚═════╝░╚═╝░░░░░╚═╝░░░░░╚══════╝╚══════╝╚═╝░░╚══╝╚══════╝░░░╚═╝░░░
echo.
echo            === SHUFFLE NET TWEAKING SOFTWARE ===
echo.
pause

:menu
cls
color 0d
echo [1] Boost system performance
echo [2] Clean temp/junk
echo [3] Enable Game Mode tweaks
echo [4] Network optimization
echo [5] Exit
echo.
set /p choice=Choose option: 

if %choice%==1 goto boost
if %choice%==2 goto temp
if %choice%==3 goto game
if %choice%==4 goto net
if %choice%==5 exit
goto menu

::::::::::::::::::::::::::::::::::::::::::
:boost
cls
echo Applying performance tweaks...
rem DISABLE STARTUP DELAYS
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul

rem DISABLE BACKGROUND APPS
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f >nul

rem SPEED UP MENU ANIMATIONS
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul

echo Performance tweaks applied!
pause
goto menu

::::::::::::::::::::::::::::::::::::::::::
:temp
cls
echo Cleaning temporary files...
del /q /f "%temp%\*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
md "%temp%" >nul 2>&1

cleanmgr /sagerun:1 >nul 2>&1

echo Temp files cleaned!
pause
goto menu

::::::::::::::::::::::::::::::::::::::::::
:game
cls
echo Enabling gaming tweaks...

rem DISABLE MOUSE ACCEL
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul

rem PRIORITIZE GAMES IN GPU
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul

echo Gaming mode activated!
pause
goto menu

::::::::::::::::::::::::::::::::::::::::::
:net
cls
echo Applying network tweaks...

rem DISABLE NAGLE’s ALGORITHM
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul

rem DNS CACHE FLUSH
ipconfig /flushdns >nul

echo Network optimized!
pause
goto menu
