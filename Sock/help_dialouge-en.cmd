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
title Assistant Sock Help - Main menu
mode con cols=68 lines=30
set a1=[X]
set a2=   
set a3=   
set a4=   
goto rewrite_1

:rewrite_1
cls
echo Use Q to Select.
echo.
echo                        _________              _________
echo            I        I  I           I          I        \
echo            I        I  I           I          I        I
echo            I________I  I________   I          I________/
echo            I        I  I           I          I
echo            I        I  I           I          I
echo            I        I  I________   I________  I
echo.
echo.
echo               +---------------------------------+
echo               I      %a1%   NAVIGATION   %a1%     I
echo               +---------------------------------+
echo.
echo               +---------------------------------+
echo               I        %a2%    none    %a2%       I
echo               +---------------------------------+
echo.
echo               +---------------------------------+
echo               I        %a3%    none    %a3%       I
echo               +---------------------------------+
echo.
echo               +---------------------------------+
echo               I        %a4%    EXIT    %a4%       I
echo               +---------------------------------+
choice /N /C WSQ
if errorlevel 255 goto rewrite_1
if errorlevel 3 goto select_1
if errorlevel 2 goto down_1
if errorlevel 1 goto up_1
if errorlevel 0 goto rewrite_1

:up_1
if "%a4%"=="[X]" set a4=   &&set a3=[X]&&goto rewrite_1
if "%a3%"=="[X]" set a3=   &&set a2=[X]&&goto rewrite_1
if "%a2%"=="[X]" set a2=   &&set a1=[X]&&goto rewrite_1
goto rewrite_1

:down_1
if "%a1%"=="[X]" set a1=   &&set a2=[X]&&goto rewrite_1
if "%a2%"=="[X]" set a2=   &&set a3=[X]&&goto rewrite_1
if "%a3%"=="[X]" set a3=   &&set a4=[X]&&goto rewrite_1
goto rewrite_1

:select_1
if "%a1%"=="[X]" goto navigation
if "%a2%"=="[X]" goto rewrite_1
if "%a3%"=="[X]" goto rewrite_1
if "%a4%"=="[X]" exit


:navigation
title Assistant Sock Help - Navigation
mode con cols=102 lines=20
echo   __            ____                      ______      ____    _________       _______   __
echo   I \    I     /    \    \         /  I  /           /    \       I      I   /       \  I \    I
echo   I  \   I    /______\    \       /   I  I    __    /______\      I      I   I       I  I  \   I
echo   I   \  I   /        \    \     /    I  \_____I   /        \     I      I   I       I  I   \  I
echo   I    \_I  /          \    \___/     I        I  /          \    I      I   \_______/  I    \_I
echo.
echo.
echo If you want to navigate, then use the keys W, S and Q.
echo W is Up, S is Down and Q is Select. There can also be special Keys, but then there's
echo going to be an information, which one the key is and what it does.
echo.
echo Here's an example:
echo Press E to exit.
echo Here you have to press the key E to exit the current program.
timeout 2 >nul
echo.
echo.
echo.
echo Press any key to get back to the main menu.
pause >nul
goto menu