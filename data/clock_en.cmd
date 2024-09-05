::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMprpWRfigYr7mYw==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMprBZRfXlVLjnTTPQJgk=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off & setlocal
set button=%sockdir%\lib\button\Button.bat 
set GetInput=%sockdir%\lib\button\GetInput.exe
cd %sockdir%\conf
(set /p windowcolor=)<theme.dat
color %windowcolor%
cd %sockdir%
goto menu


:menu
mode con cols=40 lines=22
title Assistant Sock - Clock
cls
echo.
echo                   MENU
echo.
echo.
call %button% 5 5 "          CLOCK           " 5 9 "          TIMER           " 5 13 "        STOPWATCH         " 5 18 "          EXIT            " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto clock
if %errorlevel%==2 goto timer
if %errorlevel%==3 goto stopwatch
if %errorlevel%==4 exit
goto menu


:clock
title Clock
mode con cols=28 lines=5
:clock_loop
cls
echo.
echo         -- TIME: --
echo          %time:~0,-3%
timeout 1 -nobreak >nul
goto clock_loop


:timer
mode con cols=20 lines=5
title Timer
:start_tmr
cls
set /p h1=HOURS: 
set /p m1=MINUTES: 
set /p s1=SECONDS: 
if %h1% LSS 0 (
    start %sockdir%\lib\msg.exe "This input is invalid.",48,"Warning"
    goto timer
) else if %m1% LSS 0 (
    start %sockdir%\lib\msg.exe "This input is invalid.",48,"Warning"
    goto timer
) else if %s1% LSS 0 (
    start %sockdir%\lib\msg.exe "This input is invalid.",48,"Warning"
    goto timer
)
:rw_start-tmr
mode con cols=35 lines=3
cls
echo Is this OK? [%h1%:%m1%:%s1%]
echo (Y - YES / N - NO / ESC - BACK)
call %GetInput%
if %errorlevel%==121 goto tmr_running
if %errorlevel%==110 goto start_tmr
if %errorlevel%==27 goto menu
goto rw_start-tmr

:tmr_running
mode con cols=25 lines=3
cls
echo.
echo  TIMER: %h1%:%m1%:%s1%
if "%h1%"=="0" if "%m1%"=="0" if "%s1%"=="0" (
    timeout 1 -nobreak >nul
    start %sockdir%\msg\information_timer-done_en.vbs
    start %sockdir%\sound\timer_done.vbs
    goto menu
)
if "%s1%"=="0" (
    set s1=59
    if "%m1%"=="0" set m1=59&&set /a "h1=%h1% - 1"
    if NOT "%m1%"=="0" set /a "m1=%m1% - 1"
) else (
    set /a "s1=%s1% - 1"
)
timeout 1 -nobreak >nul
goto tmr_running


:stopwatch
mode con cols=35 lines=5
title Stopwatch
:start_stopw
cls
echo.
echo Press S to start the stopwatch.
echo Press ESC to go back to the menu.
call %GetInput%
if %errorlevel%==115 goto stopw_running
if %errorlevel%==27 goto menu
goto start_stopw

:stopw_running
set h2=0
set m2=0
set s2=0
:stopw_rw
cls
echo.
echo          -- STOPWATCH --
echo.
echo           %h2%:%m2%:%s2%
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
timeout 1 -nobreak >nul
goto stopw_rw