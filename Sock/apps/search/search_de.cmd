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
title Assistent Socke - Suche
set a1=[X]
set b1=   
set c1=   
goto rewrite_1

:rewrite_1
cls
echo   ________                    _______               _________
echo  /            I          I   /          I        I  I
echo  I            I          I  /           I        I  I
echo  \________    I          I  I           I________I  I________
echo           \   I          I  I           I        I  I
echo           I   \          /  \           I        I  I
echo  _________/    \________/    \_______   I        I  I________
echo.
echo.
echo.
echo                +----------------------------+
echo                I
echo                +----------------------------+
echo.
echo                +----------------------------+
echo                I
echo                +----------------------------+
echo.
echo.
echo                +----------------------------+
echo                I
echo                +----------------------------+