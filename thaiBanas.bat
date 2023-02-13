:: Author: Ahmed Affaan
:: Title: thaiBanas.bat
:: Date: 10/02/2023
:: Folder: -
:: Country: Republic of Maldives
:: Code version: -
:: Description: -
:: Note: -

:: PROGRAM START.

@echo off

REM Remove Microsoft Edge and Outlook, news and interests icons from taskbar
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowInfoTip /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f

REM Show "This PC" icon on the desktop
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f

REM Enable remote desktop connection so you can connect to this computer from another one
REG ADD "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

REM Add Divehi language to the computer so you can use it
Control.exe intl.cpl,,/f:"C:\Program Files\Windows Kits\11\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\Divehi\winpe.cab"

REM Set the time zone to Tashkent
TZUTIL /s "West Asia Standard Time"

REM Set computer to never go to sleep or turn off
POWERCFG -X -standby-timeout-ac 0
POWERCFG -X -hibernate-timeout-ac 0

REM Set Google Chrome as the default web browser
REG ADD "HKCR\HTTP\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe\" -- \"%1\"" /f
REG ADD "HKCR\HTTPS\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe\" -- \"%1\"" /f

REM Set VLC as the default media player
REG ADD "HKCR\.mp3\OpenWithProgids" /v "VLC.mp3" /t REG_NONE /d "" /f
REG ADD "HKCR\.mp4\OpenWithProgids" /v "VLC.mp4" /t REG_NONE /d "" /f
REG ADD "HKCR\.mkv\OpenWithProgids" /v "VLC.mkv" /t REG_NONE /d "" /f
REG ADD "HKCR\Applications\vlc.exe\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\VideoLAN\VLC\vlc.exe\" --started-from-file \"%1\"" /f

:: PROGRAM END.
