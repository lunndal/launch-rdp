@echo off
rem
rem Will start the rdp launcher in the background.
rem Modify the variables to point to the template and launcher script.
rem
rem NOTE: requires PowerShell 7 or later.
rem

set "launcher=C:\Users\username\path\to\script\launch-rdp.ps1"
set "template=C:\Users\username\path\to\template\template-example.rdp"

pwsh -NoProfile -Command "[int]($PSVersionTable.PSVersion.Major) -ge 7" >nul 2>&1
if %errorlevel% neq 0 (
    title Wrong PowerShell version :(
    echo.
    echo [1;93mPowerShell 7 or later is required[0m
    echo.
    echo Get the latest PwSH here:
    echo https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows
    echo.
    echo Press any key to exit.
    pause >nul
)

start "" /b "pwsh.exe" -WindowStyle Hidden -File "%launcher%" -Template "%template%" -File %1
