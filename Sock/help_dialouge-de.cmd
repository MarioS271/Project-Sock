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
title Assistent Socke Hilfe - Hauptmen
mode con cols=70 lines=30
set a1=[X]
set a2=   
set a3=   
set a4=   
goto rewrite_1

:rewrite_1
cls
echo Verwende Q zum ausw„hlen.
echo.
echo                                      _________  _________
echo          I        I   I   I          I          I
echo          I        I   I   I          I          I
echo          I________I   I   I          I________  I________
echo          I        I   I   I          I          I
echo          I        I   I   I          I          I
echo          I        I   I   I________  I          I________
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
echo               I       %a4%   BEENDEN   %a4%       I
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
title Assistent Socke Hilfe - Navigation
mode con cols=102 lines=24
echo   __            ____                      ______      ____    _________       _______   __
echo   I \    I     /    \    \         /  I  /           /    \       I      I   /       \  I \    I
echo   I  \   I    /______\    \       /   I  I    __    /______\      I      I   I       I  I  \   I
echo   I   \  I   /        \    \     /    I  \_____I   /        \     I      I   I       I  I   \  I
echo   I    \_I  /          \    \___/     I        I  /          \    I      I   \_______/  I    \_I
echo.
echo.
echo Wenn du navigieren willst, dann verwende die Tasten W, S und Q.
echo W ist Hoch, S ist Runter und Q ist Ausw„hlen. Es kann auch spezielle Tasten geben, aber dann
echo gibt es Informationen darber, welche Taste es ist und was sie macht.
echo.
echo Hier ist ein Beispiel:
echo Drcke E zum verlassen.
echo Hier musst du die Taste E drcken um das Programm, in dem du gerade bist, zu beenden.
timeout 2 >nul
echo.
echo.
echo.
echo Drcke eine beliebige Taste um Hauptmen zurckzugelangen.
pause >nul
goto menu