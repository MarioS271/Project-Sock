::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BNsB6ja9a0bG1LpWRZY=
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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMpqdQUuLrb7T9DCT3JmdRiWjG6w==
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
cd %sockdir%\Documents
goto menu


:menu
mode con cols=68 lines=36
title Assistant Sock - Text editor
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
call %button% 15 15 "        CREATE A NEW FILE        " 15 19 "          DELETE A FILE          " 15 23 "           VIEW A FILE           " 15 27 "       OPEN DOCUMENTS FOLDER     " 15 32 "              EXIT               " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto write_file
if %errorlevel%==2 goto delete_file
if %errorlevel%==3 goto view_file
if %errorlevel%==4 start explorer.exe %sockdir%\Documents&&goto menu
if %errorlevel%==5 exit
goto menu


:write_file
mode con cols=42 lines=6
title Assistant Sock - Text editor / Create file
cd %sockdir%\Documents
cls
echo.
echo You needn't type .txt at the end.
set /p filename= Filename: 
if EXIST %filename%.txt start %sockdir%\lib\msg.exe "This file already exists!",48,"Text-editor"&&goto menu
mode con cols=68 lines=30
:writeline
cls
echo.
echo  To exit, type EXIT into a new line and hit enter.
echo.
echo.
if EXIST %filename%.txt type %filename%.txt
set /p input=
if "%input%"=="EXIT" goto menu
echo %input%>>%filename%.txt
goto writeline


:delete_file
if NOT EXIST *.txt start %sockdir%\lib\msg.exe "You don't have any files!",48,"Text-editor"&&goto rewrite_1
mode con cols=68 lines=40
title Assistant Sock - Text editor / Delete Files
cd %sockdir%\Documents
cls
echo.
echo Files:
echo ----------
dir *.txt /b
echo ----------
echo.
echo You mustn't type .txt at the end.
set /p del_file= File to delete: 
del %del_file%.txt
goto menu


:view_file
if NOT EXIST *.txt start %sockdir%\lib\msg.exe "You don't have any files!",48,"Text-editor"&&goto rewrite_1
mode con cols=80 lines=40
title Assistant Sock - Text editor / View Files
cd %sockdir%\Documents
cls
echo.
echo Files:
echo ----------
dir *.txt /b
echo ----------
echo.
echo You mustn't type .txt at the end.
set /p view_file= File to view: 
cls
echo.
echo Contents of %view_file%:
echo ----------
type %view_file%.txt
echo ----------
echo.
echo.
echo To get back to the menu, press any button.
pause >nul
goto menu