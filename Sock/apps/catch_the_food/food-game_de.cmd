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
)   else (
goto first_time_play
)


:first_time_play
title Catch the Food - Erster Start
echo {DATA}>played.dat
cd ..
echo.
echo CATCH THE FOOD
echo.
echo.
echo Willkommen zu "Catch the Food"!
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
echo (1) Wie man spielt
echo.
echo Das Spiel ist ziemlich einfach: Du musst das ganze Essen das erscheint einsammeln, durch 
echo einen Klick auf "Sammeln" beim Futter. Aber glaub' nicht, dass das es war, denn das Essen
echo bewegt sich! Aber hab keine Angst, Es ist nicht zu schnell.
echo.
echo.
echo (2) Die Regeln
echo.
echo Die Regeln sind auch sehr simpel. Hier ist eine Liste von allen Regeln:
echo   - Schlieáe die Food-Fenster nicht.
echo   - Benutze keine Tools wie z.B. einen Autoklicker
echo   - Verwende keine unerlaubten Tricks
echo.
echo.
echo (3) Level und Freeplay
echo.
echo Also, es gibt Level und Freeplay. In den Levels (es gibt 10) ist die Nummer, wie viele Fenster
echo spawnen werden, festgelegt. In Freeplay kannst du die Fenster resetten und mehr erzeugen.
timeout 4 >nul
echo.
echo.
echo Drcke eine beliebige Taste um das Spiel zu starten.
pause >nul
cls
goto play


:play
mode con cols=58 lines=20
goto int_1

:int_1
title Catch the Food - Moduswahl
set a1=[X]
set b1=   
set c1=   
goto rewrite_1

:rewrite_1
cls
echo.
echo                Bitte w„hle deinen Modus.
echo.
echo.
echo            +---------------------------------+
echo            I         %a1%  Level  %a1%         I
echo            +---------------------------------+
echo.
echo            +---------------------------------+
echo            I        %b1%  Freeplay  %b1%       I
echo            +---------------------------------+
echo.
echo.
echo            +---------------------------------+
echo            I        %c1%  Beenden  %c1%        I
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
timeout 4 >nul
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
echo            I        %a2%  Erzeugen  %a2%       I
echo            +---------------------------------+
echo.
echo            +---------------------------------+
echo            I         %b2%  Reset  %b2%         I
echo            +---------------------------------+
echo.
echo.
echo            +---------------------------------+
echo            I        %c2%  Beenden  %c2%        I
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
if "%a2%"=="[X]" LaunchOnTop.exe mshta.exe %gamedir%\food_de.hta&&goto rewrite_2
if "%b2%"=="[X]" start end_food-tiles.exe&&goto rewrite_2
if "%c2%"=="[X]" goto play