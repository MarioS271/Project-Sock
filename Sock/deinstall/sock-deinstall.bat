@echo off & setlocal
mode con cols=40 lines=3
set sockdir=%userprofile%\Assistants\Sock
title Deinstalling...
taskkill -f -im deinstall.exe
set progress=³          ³
set step=1
:rewrite
cls
echo  Deinstallation progress: %progress%
goto step_%step%

:step_1
cd %userprofile%\Desktop
if EXIST Sock.lnk del Sock.lnk
if EXIST Socke.lnk del Socke.lnk
cd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
if EXIST Sock.lnk del Sock.lnk
cd %sockdir%\conf
del *
set progress=³²         ³
set step=2
goto rewrite

:step_2
cd %sockdir%\msg
del *
cd %sockdir%\sound
del *
set progress=³²²        ³
set step=3
goto rewrite

:step_3