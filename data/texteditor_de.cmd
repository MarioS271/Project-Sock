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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMpqdQUuLrb7T9DCT3J2xRiWjG6w==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off & setlocal
set "button=%sockdir%\lib\button\Button.bat "
set "GetInput=%sockdir%\lib\button\GetInput.exe"
cd %sockdir%\conf"
(set /p windowcolor=)<theme.dat
color %windowcolor%
cd "%sockdir%\Documents"
goto menu


:menu
mode con cols=68 lines=36
title Assistent Socke - Text-Editor
cls
echo.
echo     ______________    __________                 ______________
echo           ^|           ^|               \     /          ^|
echo           ^|           ^|                \   /           ^|
echo           ^|           ^|_________        \ /            ^|
echo           ^|           ^|                  ^|             ^|
echo           ^|           ^|                 / \            ^|
echo           ^|           ^|_________       /   \           ^|
echo.
echo               ____    ___       _____   ____   ____
echo               ^|       ^|  \   ^|    ^|    /    \  ^|   \
echo               ^|---    ^|  ^|   ^|    ^|    ^|    ^|  ^|___/
echo               ^|___    ^|__/   ^|    ^|    \____/  ^|  \
echo.
echo.
call %button% 15 15 "      NEUE DATEI ERSTELLEN       " 15 19 "          DATEI LOESCHEN         " 15 23 "          DATEI ANZEIGEN         " 15 27 "     DOKUMENTE-ORDNER OEFFNEN    " 15 32 "             BEENDEN             " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto write_file
if %errorlevel%==2 goto delete_file
if %errorlevel%==3 goto view_file
if %errorlevel%==4 start explorer.exe "%sockdir%\Documents"
if %errorlevel%==5 exit
goto menu


:write_file
mode con cols=42 lines=6
cd %sockdir%\Documents
title Datei erstellen
clss
start %sockdir%\lib\filechooser.exe "save","%sockdir%\Documents","Textdateien (*.txt)|*.txt","Datei erstellen
(set /p filename=)<"%temp%\chosenfile.tmp"
mode con cols=68 lines=30
:writeline
cls
echo.
echo  Um zu beenden, schreibe EXIT in eine neue Zeile und drcke Enter.
echo.
echo.
if EXIST %filename%.txt type %filename%.txt
set /p input=
if "%input%"=="EXIT" goto menu
echo %input%>>%filename%.txt
goto writeline


:delete_file
cd %sockdir%\Documents
if NOT EXIST *.txt start %sockdir%\lib\msg.exe "Du hast noch keine Dokumente!",48,"Text-Editor"&&goto menu
mode con cols=68 lines=40
title Assistent Socke - Text-Editor / Dateien l”schen
cd %sockdir%\Documents
cls
echo.
echo Dateien:
echo ----------
dir *.txt /b
echo ----------
echo.
echo Du darfst am Ende nicht .txt schreiben.
set /p del_file= Datei zu l”schen: 
del %del_file%
goto menu


:view_file
cd %sockdir%\Documents
if NOT EXIST *.txt start %sockdir%\lib\msg.exe "Du hast noch keine Dokumente!",48,"Text-Editor"&&goto menu
mode con cols=80 lines=40
title Assistent Socke - Text-Editor / Dateien ansehen
cls
echo.
echo Dateien:
echo ----------
dir *.txt /b
echo ----------
echo.
echo Du darfst am Ende nicht .txt schreiben.
set /p view_file= Anzusehende Datei: 
cls
echo.
echo Inhalt von %view_file%:
echo ----------
type %view_file%.txt
echo ----------
echo.
echo.
echo   Um zum Men zurckzukehren, drcke eine beliebige Taste.
pause >nul
goto menu