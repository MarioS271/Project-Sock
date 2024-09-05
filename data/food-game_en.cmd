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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMprVaRfLRbLzkBnvNLScalHWj
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off & setlocal
set gamedir=%sockdir%\apps\catch_the_food
set button=%sockdir%\lib\button\Button.bat 
set GetInput=%sockdir%\lib\button\GetInput.exe
cd %sockdir%\conf
(set /p windowcolor=)<theme.dat
color %windowcolor%
:start_selector
cd %gamedir%
if EXIST data.dat (
    goto play
) else (
    goto first_time_play
)


:first_time_play
title Catch the Food - First Start
cd %gamedir%
(
echo n
echo n
echo n
echo n
echo n
echo n
echo n
echo n
)>data.dat
echo.
echo CATCH THE FOOD
echo.
echo.
echo Welcome to "Catch the Food"!
timeout 2 >nul
echo We know that you are running this game for the first time, so we have a little guide
echo for you.
timeout 2 >nul
echo.
echo Press any key to view the guide.
pause >nul
title Catch the Food - Guide
cls
echo.
echo ^(1^) How to play
echo.
echo The game is very simple: you have to collect all of the food that appears, by simply
echo clicking on ^"Collect^" on the food. But don't think that that's it, because the food is
echo moving! You have to catch it. But don't worry, it's not too fast.
echo.
echo.
echo ^(2^) The Rules
echo.
echo The Rules are also very simple. Here's a list of all rules:
echo   - Don't close the food-windows.
echo   - Don't use tools like an autoclicker.
echo   - Don't use unallowed tricks.
echo.
echo.
echo ^(3^) Levels and Freeplay
echo.
echo So, there are Levels and Freeplay. In Levels ^(there are ten of them^) the number of how
echo many windows will spawn, is specified. In Freeplay you can reset the windows and summon
echo more.
timeout 4 >nul
echo.
echo.
echo Press any key to start the game.
pause >nul
cls
goto play


:play
mode con cols=45 lines=20
title Catch the Food - Mode selection
cls
echo.
echo            Please select your mode.
echo.
echo.
call %button% 7 5 "           LEVELS          " 7 9 "          FREEPLAY         " 7 15 "            EXIT           " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto levels
if %errorlevel%==2 goto freeplay
if %errorlevel%==3 exit
goto play


:levels
mode con cols=94 lines=26
title Catch the food - Levels
(
set /p lvl1played=
set /p lvl2played=
set /p lvl3played=
set /p lvl4played=
set /p lvl5played=
set /p lvl6played=
set /p lvl7played=
set /p lvl8played=
)<data.dat
if "%lvl1played%"=="p" set lvl1played=  [ PLAYED ]  
if "%lvl2played%"=="p" set lvl2played=  [ PLAYED ]  
if "%lvl3played%"=="p" set lvl3played=  [ PLAYED ]  
if "%lvl4played%"=="p" set lvl4played=  [ PLAYED ]  
if "%lvl5played%"=="p" set lvl5played=  [ PLAYED ]  
if "%lvl6played%"=="p" set lvl6played=  [ PLAYED ]  
if "%lvl7played%"=="p" set lvl7played=  [ PLAYED ]  
if "%lvl8played%"=="p" set lvl8played=  [ PLAYED ]   
if "%lvl1played%"=="n" set lvl1played=[ NOT PLAYED ]
if "%lvl2played%"=="n" set lvl2played=[ NOT PLAYED ]
if "%lvl3played%"=="n" set lvl3played=[ NOT PLAYED ]
if "%lvl4played%"=="n" set lvl4played=[ NOT PLAYED ]
if "%lvl5played%"=="n" set lvl5played=[ NOT PLAYED ]
if "%lvl6played%"=="n" set lvl6played=[ NOT PLAYED ]
if "%lvl7played%"=="n" set lvl7played=[ NOT PLAYED ]
if "%lvl8played%"=="n" set lvl8played=[ NOT PLAYED ]
cls
echo.
echo                                  Please select your level.
echo                                   You can exit with ESC.
echo.
echo.          
echo.
echo.
echo.
echo                  %lvl1played%                               %lvl5played%
echo.
echo.
echo.
echo.
echo                  %lvl2played%                               %lvl6played%
echo.
echo.
echo.
echo.
echo                  %lvl3played%                               %lvl7played%
echo.
echo.
echo.
echo.
echo                  %lvl4played%                               %lvl8played%
call %button% 8 5 "           Level 1          " 8 10 "           Level 2          " 8 15 "           Level 3          " 8 20 "           Level 4          " 53 5 "           Level 5          " 53 10 "           Level 6          " 53 15 "           Level 7          " 53 20 "           Level 8          " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 goto play
if %errorlevel%==1 goto lvl1
if %errorlevel%==2 goto lvl2
if %errorlevel%==3 goto lvl3
if %errorlevel%==4 goto lvl4
if %errorlevel%==5 goto lvl5
if %errorlevel%==6 goto lvl6
if %errorlevel%==7 goto lvl7
if %errorlevel%==8 goto lvl8
goto levels

:lvl1
mode con cols=31 lines=14
title Level 1
for /L %%X in (1 1 2) do start %gamedir%\food_en.exe
:rw_lvl1
cls
echo.
echo         Level 1 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl1
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl1
:finish_lvl1
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        timeout 3 >nul
    )
    goto lvl1settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl1
:lvl1settingwrite
(
echo p
echo %lvl2d%
echo %lvl3d%
echo %lvl4d%
echo %lvl5d%
echo %lvl6d%
echo %lvl7d%
echo %lvl8d%
)>data.dat
goto levels

:lvl2
mode con cols=31 lines=14
title Level 2
for /L %%X in (1 1 3) do start %gamedir%\food_en.exe
:rw_lvl2
cls
echo.
echo         Level 2 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl2
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl2
:finish_lvl2
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        timeout 3 >nul
    )
    goto lvl2settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl2
:lvl2settingwrite
(
echo %lvl1d%
echo p
echo %lvl3d%
echo %lvl4d%
echo %lvl5d%
echo %lvl6d%
echo %lvl7d%
echo %lvl8d%
)>data.dat
goto levels

:lvl3
mode con cols=31 lines=14
title Level 3
for /L %%X in (1 1 4) do start %gamedir%\food_en.exe
:rw_lvl3
cls
echo.
echo         Level 3 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl3
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl3
:finish_lvl3
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        timeout 3 >nul
    )
    goto lvl3settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl3
:lvl3settingwrite
(
echo %lvl1d%
echo %lvl2d%
echo p
echo %lvl4d%
echo %lvl5d%
echo %lvl6d%
echo %lvl7d%
echo %lvl8d%
)>data.dat
goto levels

:lvl4
mode con cols=31 lines=14
title Level 4
for /L %%X in (1 1 5) do start %gamedir%\food_en.exe
:rw_lvl4
cls
echo.
echo         Level 4 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl4
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl4
:finish_lvl4
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        timeout 3 >nul
    )
    goto lvl4settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl4
:lvl4settingwrite
(
echo %lvl1d%
echo %lvl2d%
echo %lvl3d%
echo p
echo %lvl5d%
echo %lvl6d%
echo %lvl7d%
echo %lvl8d%
)>data.dat
goto levels

:lvl5
mode con cols=31 lines=14
title Level 5
for /L %%X in (1 1 6) do start %gamedir%\food_en.exe
:rw_lvl5
cls
echo.
echo         Level 5 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl5
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl5
:finish_lvl5
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        timeout 3 >nul
    )
    goto lvl5settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl5
:lvl5settingwrite
(
echo %lvl1d%
echo %lvl2d%
echo %lvl3d%
echo %lvl4d%
echo p
echo %lvl6d%
echo %lvl7d%
echo %lvl8d%
)>data.dat
goto levels

:lvl6
mode con cols=31 lines=14
for /L %%X in (1 1 7) do start %gamedir%\food_en.exe
:rw_lvl6
cls
echo.
echo         Level 6 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl6
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl6
:finish_lvl6
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        echo %lvl9d%
        echo %lvl10d%
        timeout 3 >nul
    )
    goto lvl6settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl6
:lvl6settingwrite
(
echo %lvl1d%
echo %lvl2d%
echo %lvl3d%
echo %lvl4d%
echo %lvl5d%
echo p
echo %lvl7d%
echo %lvl8d%
)>data.dat
goto levels

:lvl7
mode con cols=31 lines=14
title Level 7
for /L %%X in (1 1 8) do start %gamedir%\food_en.exe
:rw_lvl7
cls
echo.
echo         Level 7 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl7
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl7
:finish_lvl7
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        timeout 3 >nul
    )
    goto lvl7settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl7
:lvl7settingwrite
(
echo %lvl1d%
echo %lvl2d%
echo %lvl3d%
echo %lvl4d%
echo %lvl5d%
echo %lvl6d%
echo p
echo %lvl8d%
)>data.dat
goto levels

:lvl8
mode con cols=31 lines=14
title Level 8
for /L %%X in (1 1 9) do start %gamedir%\food_en.exe
:rw_lvl8
cls
echo.
echo         Level 8 started!
echo.
echo.
call %button% 6 5 "     FINISH     " 6 10  "      EXIT      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto finish_lvl8
if %errorlevel%==2 start end_food-tiles.exe&&goto levels
goto rw_lvl8
:finish_lvl8
echo {CHECK}>check.tmp
cls
echo Checking...
timeout 4 /nobreak >nul
del check.tmp
if NOT EXIST running.tmp (
    (
    set /p lvl1d=
    set /p lvl2d=
    set /p lvl3d=
    set /p lvl4d=
    set /p lvl5d=
    set /p lvl6d=
    set /p lvl7d=
    set /p lvl8d=
    )<data.dat
    (set /p debug=)<%sockdir%\conf\conf.dat
    if "%debug%"=="y" (
        echo Current config:
        echo %lvl1d%
        echo %lvl2d%
        echo %lvl3d%
        echo %lvl4d%
        echo %lvl5d%
        echo %lvl6d%
        echo %lvl7d%
        echo %lvl8d%
        timeout 3 >nul
    )
    goto lvl8settingwrite
)
start %sockdir%\lib\msg.exe "You haven't completed this level yet!",48,"Catch the food"
goto rw_lvl8
:lvl8settingwrite
(
echo %lvl1d%
echo %lvl2d%
echo %lvl3d%
echo %lvl4d%
echo %lvl5d%
echo %lvl6d%
echo %lvl7d%
echo p
)>data.dat
goto levels


:freeplay
mode con cols=45 lines=20
title Catch the Food - Freeplay
:rw_freeplay
cls
echo.  
echo                   FREEPLAY
echo.
echo.
call %button% 6 5 "         SPAWN FOOD         " 6 9 "         RESET FOOD         " 6 15 "            BACK            " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 start end_food-tiles.exe&&goto play
if %errorlevel%==1 start %gamedir%\food_en.exe&&goto rw_freeplay
if %errorlevel%==2 start end_food-tiles.exe&&goto rw_freeplay
if %errorlevel%==3 start end_food-tiles.exe&&goto play
goto rw_freeplay