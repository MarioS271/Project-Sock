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
mode con cols=40 lines=22
title Assistent Socke - Uhr
set a1=[X]
set b1=   
set c1=   
set d1=   
goto rewrite_1

:rewrite_1
cls
echo.
echo              ----- MENš -----
echo.
echo.
echo      +----------------------------+
echo      I       %a1%   Uhr   %a1%      I
echo      +----------------------------+
echo.
echo      +----------------------------+
echo      I      %b1%   Timer   %b1%     I
echo      +----------------------------+
echo.
echo      +----------------------------+
echo      I     %c1%  Stoppuhr  %c1%     I
echo      +----------------------------+
echo.
echo.
echo      +----------------------------+
echo      I      %d1%  Beenden  %d1%     I
echo      +----------------------------+
choice /N /C WSQ
if errorlevel 255 goto rewrite_1
if errorlevel 3 goto select_1
if errorlevel 2 goto down_1
if errorlevel 1 goto up_1
if errorlevel 0 goto rewrite_1

:up_1
if "%d1%"=="[X]" set d1=   &&set c1=[X]&&goto rewrite_1
if "%c1%"=="[X]" set c1=   &&set b1=[X]&&goto rewrite_1
if "%b1%"=="[X]" set b1=   &&set a1=[X]&&goto rewrite_1
goto rewrite_1

:down_1
if "%a1%"=="[X]" set a1=   &&set b1=[X]&&goto rewrite_1
if "%b1%"=="[X]" set b1=   &&set c1=[X]&&goto rewrite_1
if "%c1%"=="[X]" set c1=   &&set d1=[X]&&goto rewrite_1
goto rewrite_1

:select_1
if "%a1%"=="[X]" goto clock
if "%b1%"=="[X]" goto timer
if "%c1%"=="[X]" goto stopwatch
if "%d1%"=="[X]" exit


:clock
title Uhr
mode con cols=28 lines=5
:clock_loop
cls
echo.
echo      -- ZEIT: --
echo       %time:~0,-3%
ping /n 2 0.0.0.0 >nul
goto clock_loop


:timer
mode con cols=38 lines=5
title Timer
:start_tmr
cls
set /p h1=STUNDEN: 
set /p m1=MINUTEN: 
set /p s1=SEKUNDEN: 
cls
echo Ist dies OK? [%h1%:%m1%:%s1%] (Y/N)
choice /N /C YN
if errorlevel 255 goto start_tmr
if errorlevel 2 goto start_tmr
if errorlevel 1 mode con cols=35 lines=5&&goto tmr_running
if errorlevel 0 goto start_tmr

:tmr_running
cls
echo.
echo              -- TIMER --
echo.
echo              %h1%:%m1%:%s1%
if "%h1%"=="0" if "%m1%"=="0" if "%s1%"=="0" goto tmr_done
if "%s1%"=="0" (
set s1=59
if "%m1%"=="0" set m1=59&&set /a "h1=%h1% - 1"
if NOT "%m1%"=="0" set /a "m1=%m1% - 1"
) else (
set /a "s1=%s1% - 1"
)
ping /n 2 0.0.0.0 >nul
goto tmr_running

:tmr_done
ping /n 2 0.0.0.0 >nul
cd %sockdir%\msg
start information_timer-done_de.vbs
cd %sockdir%\sound
start timer_done.vbs
goto menu


:stopwatch
mode con cols=38 lines=5
title Stoppuhr
:start_stopw
cls
echo.
echo Drcke S um die Stoppuhr zu starten.
echo Drcke B um zum Men zurckzukehren.
choice /N /C SB
if errorlevel 255 goto start_stopw
if errorlevel 2 goto menu
if errorlevel 1 goto stopw_running
if errorlevel 0 goto start_stopw

:stopw_running
mode con cols=35 lines=5
set h2=0
set m2=0
set s2=0
:stopw_rw
cls
echo.
echo            -- STOPPUHR --
echo.
echo            %h2%:%m2%:%s2%
if "%s2%"=="59" (
set s2=0
set /a "m2=%m2% + 1"
)
if "%m2%"=="59" (
set m2=0
set /a "h2=%h2% + 1"
) else (
set /a "s2=%s2% + 1"
)
ping /n 2 0.0.0.0 >nul
goto stopw_rw