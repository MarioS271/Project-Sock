@echo off & setlocal
set sockdir=%userprofile%\Assistants\Sock
set gamedir=%userprofile%\Assistants\Sock\apps\catch_the_food
cd %sockdir%\conf
if EXIST darkmode.dat color 0f
if EXIST lightmode.dat color f0
cd %gamedir%\data
if EXIST played.dat (
cd ..
goto play
) else (
goto first_time_play
)


:first_time_play
title Catch the Food - First Start
echo {DATA}>played.dat
cd ..
echo.
echo CATCH THE FOOD
echo.
echo.
echo Welcome to "Catch the Food"!
timeout 2 >nul
echo We know that you are running this game for the forst time, so we have a little guide
echo for you.
timeout 2 >nul
echo.
echo Press any key to view the guide.
pause >nul
title Catch the Food - Guide
cls
echo.
echo (1) How to play
echo.
echo The game is very simple: you have to collect all of the food that appears, by simply
echo clicking on "Collect" on the food. But don't think that that's it, because the food is
echo moving! You have to catch it. But don't worry, it's not too fast.
echo.
echo.
echo (2) The Rules
echo.
echo The Rules are also very simple. Here's a list of all rules:
echo   - Don't close the food-windows.
echo   - Don't use tools like an autoclicker.
echo   - Don't use unallowed tricks.
echo.
echo.
echo (3) Levels and Freeplay
echo.
echo So, there are Levels and Freeplay. In Levels (there are ten of them) the number of how
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
mode con cols=58 lines=20
goto int_1

:int_1
title Catch the Food - Mode selection
set a1=[X]
set b1=   
set c1=   
goto rewrite_1

:rewrite_1
cls
echo.
echo                  Please select your mode.
echo.
echo.
echo            +---------------------------------+
echo            I         %a1%  Levels  %a1%        I
echo            +---------------------------------+
echo.
echo            +---------------------------------+
echo            I        %b1%  Freeplay  %b1%       I
echo            +---------------------------------+
echo.
echo.
echo            +---------------------------------+
echo            I        %c1%    Exit    %c1%       I
echo            +---------------------------------+
choice /N /C WSQ
if errorlevel 255 goto rewrite_1
if errorlevel 3 goto select_1
if errorlevel 2 goto down_1
if errorlevel 1 goto up_1
if errorlevel 0 goto rewrite_1

:up_1
if "%c1%"=="[X]" set c1=   &&set b1=[X]&&goto rewrite_1
if "%b1%"=="[X]" set b1=   &&set a1=[X]&&goto rewrite_1
goto rewrite_1

:down_1
if "%a1%"=="[X]" set a1=   &&set b1=[X]&&goto rewrite_1
if "%b1%"=="[X]" set b1=   &&set c1=[X]&&goto rewrite_1
goto rewrite_1

:select_1
if "%a1%"=="[X]" cls&&goto levels
if "%b1%"=="[X]" cls&&goto freeplay
if "%c1%"=="[X]" exit


:levels
echo COMMING SOON!
timeout 2 >nul
goto play


:freeplay
mode con cols=58 lines=20
goto int_2

:int_2
title Catch the Food - Freeplay
set a2=[X]
set b2=   
set c2=   
goto rewrite_2

:rewrite_2
cls
echo.  
echo                       --- FREEPLAY ---
echo.
echo.
echo            +---------------------------------+
echo            I         %a2%  Summon  %a2%        I
echo            +---------------------------------+
echo.
echo            +---------------------------------+
echo            I         %b2%  Reset  %b2%         I
echo            +---------------------------------+
echo.
echo.
echo            +---------------------------------+
echo            I          %c2%  Exit  %c2%         I
echo            +---------------------------------+
choice /N /C WSQ
if errorlevel 255 goto rewrite_2
if errorlevel 3 goto select_2
if errorlevel 2 goto down_2
if errorlevel 1 goto up_2
if errorlevel 0 goto rewrite_2

:up_2
if "%c2%"=="[X]" set c2=   &&set b2=[X]&&goto rewrite_2
if "%b2%"=="[X]" set b2=   &&set a2=[X]&&goto rewrite_2
goto rewrite_2

:down_2
if "%a2%"=="[X]" set a2=   &&set b2=[X]&&goto rewrite_2
if "%b2%"=="[X]" set b2=   &&set c2=[X]&&goto rewrite_2
goto rewrite_2

:select_2
if "%a2%"=="[X]" LaunchOnTop.exe mshta.exe %gamedir%\food_en.hta&&goto rewrite_2
if "%b2%"=="[X]" start end_food-tiles.exe&&goto rewrite_2
if "%c2%"=="[X]" goto play