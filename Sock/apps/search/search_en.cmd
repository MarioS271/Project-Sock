@echo off & setlocal
set sockdir=%userprofile%\Assistants\Sock
cd %sockdir%\conf
if EXIST darkmode.dat color 0f
if EXIST lightmode.dat color f0
cd %sockdir%
goto menu


:menu
goto int_1

:int_1
mode con cols=80 lines=24
title Assistant Sock - Searchmenu
set a1=[X]
set b1=   
set c1=   
goto rewrite_1

:rewrite_1
cls
echo   ________    _________         _         ________      ________   
echo  /            I                / \        I       \    /           I         I
echo  I            I               /   \       I       I   /            I         I
echo  \________    I________      /     \      I_______/   I            I_________I
echo           \   I             /_______\     I     \     I            I         I
echo           I   I            /         \    I      \    \            I         I
echo  _________/   I________   /           \   I       \    \________   I         I
echo.
echo.
echo.
set /p search_1=Search: 
if EXIST %search_1% (
goto 
) else (
cd %sockdir%\msg
start error.search_not-found.vbs
)


:foldersearch
echo COMMING SOON!
timeout 4 >nul
goto menu