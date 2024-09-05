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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMprVaRfLRbLzkBnvMJicalHWj
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
title Catch the Food - Erster Start
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
echo Willkommen zu ^"Catch the Food^"^!
timeout 2 >nul
echo Wir wissen dass du dieses Spiel zum ersten mal startest, deshalb haben eine kleinen
echo Anleitung fr dich.
timeout 2 >nul
echo.
echo Drcke eine beliebige Taste um die Anleitung anzuzeigen.
pause >nul
title Catch the Food - Anleitung
cls
echo.
echo ^(1^) Wie man spielt
echo.
echo Das Spiel ist ziemlich einfach: Du musst das ganze Essen das erscheint einsammeln, durch 
echo einen Klick auf ^"Sammeln^" beim Futter. Aber glaub' nicht, dass das es war, denn das Essen
echo bewegt sich! Aber hab keine Angst, Es ist nicht zu schnell.
echo.
echo.
echo ^(2^) Die Regeln
echo.
echo Die Regeln sind auch sehr simpel. Hier ist eine Liste von allen Regeln:
echo   - Schlieáe die Food-Fenster nicht.
echo   - Benutze keine Tools wie z.B. einen Autoklicker
echo   - Verwende keine unerlaubten Tricks
echo.
echo.
echo ^(3^) Level und Freeplay
echo.
echo Also, es gibt Level und Freeplay. In den Levels ^(es gibt 10^) ist die Nummer, wie viele Fenster
echo spawnen werden, festgelegt. In Freeplay kannst du die Fenster resetten und mehr erzeugen.
timeout 4 >nul
echo.
echo.
echo Drcke eine beliebige Taste um das Spiel zu starten.
pause >nul
cls
goto play


:play
mode con cols=45 lines=20
title Catch the Food - Moduswahl
cls
echo.
echo           Bitte w„hle deinen Modus.
echo.
echo.
call %button% 7 5 "           LEVEL           " 7 9 "        FREIES SPIEL       " 7 15 "          BEENDEN          " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto levels
if %errorlevel%==2 goto freeplay
if %errorlevel%==3 exit
goto play

:levels
mode con cols=94 lines=27
title Catch the Food - Levels
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
if "%lvl1played%"=="p" set lvl1played= [ GESPIELT ]  
if "%lvl2played%"=="p" set lvl2played= [ GESPIELT ] 
if "%lvl3played%"=="p" set lvl3played= [ GESPIELT ] 
if "%lvl4played%"=="p" set lvl4played= [ GESPIELT ] 
if "%lvl5played%"=="p" set lvl5played= [ GESPIELT ] 
if "%lvl6played%"=="p" set lvl6played= [ GESPIELT ] 
if "%lvl7played%"=="p" set lvl7played= [ GESPIELT ] 
if "%lvl8played%"=="p" set lvl8played= [ GESPIELT ] 
if "%lvl1played%"=="n" set lvl1played=[ NICHT GES. ]
if "%lvl2played%"=="n" set lvl2played=[ NICHT GES. ]
if "%lvl3played%"=="n" set lvl3played=[ NICHT GES. ]
if "%lvl4played%"=="n" set lvl4played=[ NICHT GES. ]
if "%lvl5played%"=="n" set lvl5played=[ NICHT GES. ]
if "%lvl6played%"=="n" set lvl6played=[ NICHT GES. ]
if "%lvl7played%"=="n" set lvl7played=[ NICHT GES. ]
if "%lvl8played%"=="n" set lvl8played=[ NICHT GES. ]
cls
echo.
echo                                  Bitte w„hle dein Level.
echo                         Du kannst mit ESC zum Hauptmen zurckkehren.
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
call %button% 8 5 "           LEVEL 1          " 8 10 "           LEVEL 2          " 8 15 "           LEVEL 3          " 8 20 "           LEVEL 4          " 53 5 "           LEVEL 5          " 53 10 "           LEVEL 6          " 53 15 "           LEVEL 7          " 53 20 "           LEVEL 8          " # Press
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
for /L %%X in (1 1 2) do start %gamedir%\food_de.exe
:rw_lvl1
cls
echo.
echo        Level 1 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
for /L %%X in (1 1 3) do start %gamedir%\food_de.exe
:rw_lvl2
cls
echo.
echo        Level 2 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
for /L %%X in (1 1 4) do start %gamedir%\food_de.exe
:rw_lvl3
cls
echo.
echo        Level 3 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
for /L %%X in (1 1 5) do start %gamedir%\food_de.exe
:rw_lvl4
cls
echo.
echo        Level 4 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
for /L %%X in (1 1 6) do start %gamedir%\food_de.exe
:rw_lvl5
cls
echo.
echo        Level 5 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
for /L %%X in (1 1 7) do start %gamedir%\food_de.exe
:rw_lvl6
cls
echo.
echo        Level 6 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
        timeout 3 >nul
    )
    goto lvl6settingwrite
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
for /L %%X in (1 1 8) do start %gamedir%\food_de.exe
:rw_lvl7
cls
echo.
echo        Level 7 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
for /L %%X in (1 1 9) do start %gamedir%\food_de.exe
:rw_lvl8
cls
echo.
echo        Level 8 gestartet!
echo.
echo.
call %button% 6 5 "     BEENDEN    " 6 10  "    VERLASSEN   " # Press
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
) else (del running.tmp)
start %sockdir%\lib\msg.exe "Du hast dieses Level noch nicht geschafft!",48,"Catch the food"
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
title Catch the Food - Freies Spiel
:rw_freeplay
cls
echo.  
echo                 FREIES SPIEL
echo.
echo.
call %button% 6 5 "        FOOD SPAWNEN        " 6 9 "     FOOD ZURUECKSETZEN     " 6 15 "          ZURUECK           " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 start end_food-tiles.exe&&goto play
if %errorlevel%==1 start %gamedir%\food_de.exe&&goto rw_freeplay
if %errorlevel%==2 start end_food-tiles.exe&&goto rw_freeplay
if %errorlevel%==3 start end_food-tiles.exe&&goto play
goto rw_freeplay