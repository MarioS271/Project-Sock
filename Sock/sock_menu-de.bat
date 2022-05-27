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
mode con cols=66 lines=30
title Assistent Socke - MenÅ
set a1=[X]
set b1=   
set c1=   
set d1=   
goto rewrite_1

:rewrite_1
cls
cd %sockdir%\conf
if EXIST terminal_enabled.dat (
    mode con cols=66 lines=32
    echo DrÅcke T um das Terminal aufzurufen.
    echo.
)
echo     __          __    __________    __               I   I   
echo     I \        / I    I             I \      I    I         I     
echo     I  \      /  I    I             I  \     I    I         I
echo     I   \    /   I    I_________    I   \    I    I         I
echo     I    \__/    I    I             I    \   I    I         I
echo     I            I    I             I     \  I    \         /
echo     I            I    I_________    I      \_I     \_______/ 
echo.
echo.
echo  Was willst du tun?
echo.
echo.
echo            +---------------------------------+
echo            I          %a1%  APPS  %a1%         I
echo            +---------------------------------+
echo.
echo            +---------------------------------+
echo            I          %b1%  none  %b1%         I
echo            +---------------------------------+
echo.
echo            +---------------------------------+
echo            I     %c1%  EINSTELLUNGEN  %c1%     I
echo            +---------------------------------+
echo.
echo            +---------------------------------+
echo            I        %d1%  BEENDEN  %d1%        I
echo            +---------------------------------+
choice /N /C WSQHT
if errorlevel 255 goto rewrite_1
if errorlevel 5 cd %sockdir%\conf&&if EXIST terminal_enabled.dat goto terminal
if errorlevel 4 goto help
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
if "%a1%"=="[X]" cls&&goto apps
if "%b1%"=="[X]" cls&&goto NONE
if "%c1%"=="[X]" cls&&goto settings
if "%d1%"=="[X]" cls&&exit
goto rewrite_1


:apps
goto int_2

:int_2
mode con cols=mode con cols=70 lines=32
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" mode con cols=70 lines=44&&goto continue3287632
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" mode con cols=70 lines=40&&goto continue3287632
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" mode con cols=70 lines=40&&goto continue3287632
if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" mode con cols=70 lines=40&&goto continue3287632
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" mode con cols=70 lines=36&&goto continue3287632
if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" mode con cols=70 lines=36&&goto continue3287632
if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" mode con cols=70 lines=36&&goto continue3287632
:continue3287632
title Assistent Socke - MenÅ / Apps
set a2=[X]
set b2=   
set c2=   
set d2=   
set e2=   
set f2=   
set g2=   
set h2=   
set i2=   
goto rewrite_2

:rewrite_2
cls
echo.
echo  Welche App willst du starten? (DrÅcke Z um zum MenÅ zurÅckzukehren.)
echo.
echo.
echo                  +---------------------------------+
echo                  I        %a2%  Explorer  %a2%       I
echo                  +---------------------------------+
echo.
echo                  +---------------------------------+
echo                  I         %b2%  Editor  %b2%        I
echo                  +---------------------------------+
echo.
echo                  +---------------------------------+
echo                  I         %c2%  Paint  %c2%         I
echo                  +---------------------------------+
echo.
echo                  +---------------------------------+
echo                  I          %d2%  Uhr  %d2%          I
echo                  +---------------------------------+
echo.
echo                  +---------------------------------+
echo                  I          %e2%  CMD  %e2%          I
echo                  +---------------------------------+
echo.
echo                  +---------------------------------+
echo                  I     %f2%  Catch the Food  %f2%    I
echo                  +---------------------------------+
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" (
    echo.
    echo                  +---------------------------------+
    echo                  I          %g2%  Word  %g2%         I
    echo                  +---------------------------------+
)
if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" (
    echo.
    echo                  +---------------------------------+
    echo                  I         %h2%  Excel  %h2%         I
    echo                  +---------------------------------+
)
if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" (
    echo.
    echo                  +---------------------------------+
    echo                  I       %i2%  PowerPoint  %i2%      I
    echo                  +---------------------------------+
)
choice /N /C WSQZ
if errorlevel 255 goto rewrite_2
if errorlevel 4 goto menu
if errorlevel 3 goto select_2
if errorlevel 2 goto down_2
if errorlevel 1 goto up_2
if errorlevel 0 goto rewrite_2

:up_2
if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" if "%i2%"=="[X]" set i2=   &&set h2=[X]&&goto rewrite_2
if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" if "%h2%"=="[X]" set h2=   &&set g2=[X]&&goto rewrite_2
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" if "%g2%"=="[X]" set g2=   &&set f2=[X]&&goto rewrite_2
if "%f2%"=="[X]" set f2=   &&set e2=[X]&&goto rewrite_2
if "%e2%"=="[X]" set e2=   &&set d2=[X]&&goto rewrite_2
if "%d2%"=="[X]" set d2=   &&set c2=[X]&&goto rewrite_2
if "%c2%"=="[X]" set c2=   &&set b2=[X]&&goto rewrite_2
if "%b2%"=="[X]" set b2=   &&set a2=[X]&&goto rewrite_2
goto rewrite_2

:down_2
if "%a2%"=="[X]" set a2=   &&set b2=[X]&&goto rewrite_2
if "%b2%"=="[X]" set b2=   &&set c2=[X]&&goto rewrite_2
if "%c2%"=="[X]" set c2=   &&set d2=[X]&&goto rewrite_2
if "%d2%"=="[X]" set d2=   &&set e2=[X]&&goto rewrite_2
if "%e2%"=="[X]" set e2=   &&set f2=[X]&&goto rewrite_2
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" if "%f2%"=="[X]" set f2=   &&set g2=[X]&&goto rewrite_2
if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" if "%g2%"=="[X]" set g2=   &&set h2=[X]&&goto rewrite_2
if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" if "%h2%"=="[X]" set h2=   &&set i2=[X]&&goto rewrite_2
goto rewrite_2

:select_2
if "%a2%"=="[X]" cls&&start explorer.exe&&goto menu
if "%b2%"=="[X]" cls&&start notepad.exe&&goto menu
if "%c2%"=="[X]" cls&&start mspaint.exe&&goto menu
if "%d2%"=="[X]" cls&&cd %sockdir%\apps\clock&&start clock_de.lnk&&goto menu
if "%e2%"=="[X]" cls&&start cmd.exe&&goto menu
if "%f2%"=="[X]" cls&&cd %sockdir%\apps\catch_the_food&&start food-game_de.lnk&&goto menu
if EXIST "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe" if "%g2%"=="[X]" cls&&start WINWORD.exe&&goto menu
if EXIST "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe" if "%h2%"=="[X]" cls&&start EXCEL.exe&&goto menu
if EXIST "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe" if "%i2%"=="[X]" cls&&start POWERPNT.exe&&goto menu


:NONE
goto rewrite_1


:settings
goto int_3

:int_3
mode con cols=64 lines=24
title Assistent Socke - MenÅ / Einstellungen
set a3=[X]
set b3=   
set c3=   
set d3=   
cd %sockdir%\conf
if EXIST en.dat set setting1status=ENGLISCH
if EXIST de.dat set setting1status=DEUTSCH
if EXIST launchonstart.dat set setting2status=JA
if NOT EXIST launchonstart.dat set setting2status=NEIN
if EXIST darkmode.dat set setting3status=DUNKLER MODUS
if EXIST lightmode.dat set setting3status=HELLER MODUS
goto rewrite_3

:rewrite_3
cls
echo.
echo                    ----- SETTINGS -----
echo.
echo   Um zum MenÅ zurÅckzukehren, drÅcke Z.
echo.
echo.
echo      +---------------------------------+
echo      I        %a3%  Sprache  %a3%        I    [ %setting1status% ]
echo      +---------------------------------+
echo.
echo      +---------------------------------+
echo      I    %b3% Bei Start starten %b3%    I    [ %setting2status% ]
echo      +---------------------------------+
echo.
echo      +---------------------------------+
echo      I     %c3% Erscheinunsgbild %c3%    I    [ %setting3status% ]
echo      +---------------------------------+
echo.
echo.
echo      +---------------------------------+
echo      I     %d3%  Deinstallieren  %d3%    I
echo      +---------------------------------+
choice /N /C WSQZTD
if errorlevel 255 goto rewrite_3
if errorlevel 6 goto dev_list
if errorlevel 5 goto toggle_terminal
if errorlevel 4 goto menu
if errorlevel 3 goto select_3
if errorlevel 2 goto down_3
if errorlevel 1 goto up_3
if errorlevel 0 goto rewrite_3

:up_3
if "%d3%"=="[X]" set d3=   &&set c3=[X]&&goto rewrite_3
if "%c3%"=="[X]" set c3=   &&set b3=[X]&&goto rewrite_3
if "%b3%"=="[X]" set b3=   &&set a3=[X]&&goto rewrite_3
goto rewrite_3

:down_3
if "%a3%"=="[X]" set a3=   &&set b3=[X]&&goto rewrite_3
if "%b3%"=="[X]" set b3=   &&set c3=[X]&&goto rewrite_3
if "%c3%"=="[X]" set c3=   &&set d3=[X]&&goto rewrite_3
goto rewrite_3

:select_3
if "%a3%"=="[X]" goto changesetting1
if "%b3%"=="[X]" goto changesetting2
if "%c3%"=="[X]" goto changesetting3
if "%d3%"=="[X]" goto deinstall

:changesetting1
if "%setting1status%"=="ENGLISCH" (
cd %sockdir%\conf
ren en.dat de.dat
cd %sockdir%\msg
start change-setting_de.vbs
set setting1status=DEUTSCH
cd %userprofile%\Desktop
if EXIST Sock.lnk ren Sock.lnk Socke.lnk
goto rewrite_3
)
if "%setting1status%"=="DEUTSCH" (
    cd %sockdir%\conf
    ren de.dat en.dat
    cd %sockdir%\msg
    start change-setting_de.vbs
    set setting1status=ENGLISH
    cd %userprofile%\Desktop
    if EXIST Socke.lnk ren Socke.lnk Sock.lnk
    goto rewrite_3
)
goto rewrite_3

:changesetting2
set startshell="%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
if "%setting2status%"=="JA" (
    cd %sockdir%\conf
    del launchonstart.dat
    set setting2status=NEIN
    cd %startshell%
    del Sock.lnk
    goto rewrite_3
)
if "%setting2status%"=="NEIN" (
    cd %sockdir%\conf
    echo {DATA}>launchonstart.dat
    set setting2status=JA
    cd %sockdir%\lnk
    xcopy Sock.lnk %startshell%
    goto rewrite_3
)
goto rewrite_3

:changesetting3
if "%setting3status%"=="DUNKLER MODUS" (
    cd %sockdir%\conf
    ren darkmode.dat lightmode.dat
    cd %sockdir%\msg
    start change-setting_de.vbs
    set setting3status=HELLER MODUS
    goto rewrite_3
)
if "%setting3status%"=="HELLER MODUS" (
    cd %sockdir%\conf
    ren lightmode.dat darkmode.dat
    cd %sockdir%\msg
    start change-setting_de.vbs
    set setting3status=DUNKLER MODUS
    goto rewrite_3
)
goto rewrite_3

:toggle_terminal
if EXIST terminal_enabled.dat (
    cd %sockdir%\msg
    start terminal-disabled_en.vbs
    cd %sockdir%\conf
    del terminal_enabled.dat
) else if NOT EXIST terminal_enabled.dat (
    cd %sockdir%\msg
    start terminal-enabled_en.vbs
    cd %sockdir%\conf
    echo {DATA}>terminal_enabled.dat
)
goto rewrite_3

:dev_list  rem Easter Egg
title Entwicklerliste (EASTER EGG)
mode con cols=60 lines=12
cls
timeout 1 >nul
echo MarioS271      -       Hauptentwickler / Designer / Ideen
timeout 1 >nul
echo lukas222       -       Entwickler /  Tester
timeout 1 >nul
echo Jojoboss3      -       Ideen
timeout 1 >nul
echo franz1866      -       Tester
timeout 4 >nul
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Um zum MenÅ zurÅckzukehren, drÅcke einen beliebigen Button.
pause >nul
goto menu

:deinstall
:d_ask
cd %sockdir%\msg
start /WAIT warn_deinstall_de.vbs
:int_4
title Assistent Socke - Deinstallieren bestÑtigen
set a4=   
set b4=[X]
:rewrite_4
cls
echo.
echo  Willst du Socke wirklich deinstallieren?
echo.
echo.
echo          +--------------------+
echo          I    %a4%  JA  %a4%    I
echo          +--------------------+
echo.
echo          +--------------------+
echo          I   %b4%  NEIN  %b4%   I
echo          +--------------------+
choice /N /C WSQ
if errorlevel 255 goto rewrite_4
if errorlevel 3 goto select_4
if errorlevel 2 goto down_4
if errorlevel 1 goto up_4
if errorlevel 0 goto rewrite_4

:up_4
if "%b4%"=="[X]" set b4=   &&set a4=[X]&&goto rewrite_4
goto rewrite_4

:down_4
if "%a4%"=="[X]" set a4=   &&set b4=[X]&&goto rewrite_4
goto rewrite_4

:select_4
if "%a4%"=="[X]" goto d_yes
if "%b4%"=="[X]" goto settings

:d_yes
title Assistent Socke - Deinstallation
echo Vorbereiten zur Deinstallation...
tasklist /fi "IMAGENAME eq mshta.exe" 2>nul | find /i /n "mshta.exe" >nul
if errorlevel 0 taskkill -f -im mshta.exe
start %sockdir%\deinstall\deinstall.lnk
exit


:terminal
cls
mode con cols=80 lines=20
title Assistent Socke - Terminal
:commandline
echo.
set /p  command=cmd ~$ 
if "%command%"=="exit" goto menu
if "%command%"=="help" (
    echo.
    echo             -- HILFE --
    echo.
    echo  help          -           Zeigt diese Liste an.
    echo  windowcolor   -           éndert die Farbe des
    echo                            Fensters.
    echo  setting       -           éndert eine Einstellung.
    echo  exit          -           Beendet und geht zum
    echo                            HauptmenÅ zurÅck.
    echo.
    echo.
    goto commandline
)
if "%command%"=="windowcolor" (
    echo.
    echo  Fehlender Parameter, versuche 'windowcolor help'
    echo.
    goto commandline 
)
if "%command%"=="windowcolor help" (
    echo.
    echo  Benutzung dieses Befehls:
    echo.
    echo  windowcolor set
    echo    Es wird eine Frage da sein die fragt, zu welcher Farbe man
    echo    wechseln mîchte. Gib es in diesem Format ein: 
    echo    'Hintergroundfarbe''Vordergrundfarbe'
    echo    Farben:
    echo.
    echo    0     -     Schwarz       8     -     Grau
    echo    1     -     Blau          9     -     Hellblau
    echo    2     -     GrÅn          a     -     HellgrÅn
    echo    3     -     TÅrkis        b     -     HelltÅrkis
    echo    4     -     Rot           c     -     Hellrot
    echo    5     -     Lila          d     -     Helllila
    echo    6     -     Gelb          e     -     Hellgelb
    echo    7     -     Hellgrau      f     -     Wei·
    echo.
    echo  windowcolor reset
    echo.
    goto commandline 
)
if "%command%"=="windowcolor set" (
    echo.
    echo  Gib die Farben ein zu denen du Ñndern willst:
    echo.
    set /p colors=Farben: 
    echo.
    goto cmd3259
)
if "%command%"=="windowcolor reset" (
    cd %sockdir%\conf
    if EXIST darkmode.dat color 0f
    if EXIST lightmode.dat color f0
    goto commandline
)
if "%command%"=="setting" (
    echo.
    echo  Fehlender Parameter, versuche 'setting help'
    echo.
    goto commandline
)
if "%command%"=="setting help" (
    echo.
    echo  Benutzung dieses Befehls:
    echo.
    echo  setting change 'setting'
    echo  setting get 'setting'
    echo  énderbare Einstellungen:
    echo.
    echo   - appearence
    echo   - language
    echo.
    echo.
    goto commandline
)
if "%command%"=="setting change" (
    echo.
    echo  Fehler: Keine Einstellung angegeben.
    echo.
    echo  Mîgliche Einstellungen:
    echo.
    echo    - appearence
    echo    - language
    echo.
    goto commandline
)
if "%command%"=="setting change appearence" (
    cd %sockdir%\conf
    if EXIST darkmode.dat (
        ren darkmode.dat lightmode.dat
        echo.
        cd %sockdir%\msg
        start /WAIT change-setting_en.vbs
        goto commandline
    )
    if EXIST lightmode.dat (
        ren lightmode.dat darkmode.dat
        echo.
        cd %sockdir%\msg
        start /WAIT change-setting_en.vbs
        goto commandline
    )
)
if "%command%"=="setting change language" (
    cd %sockdir%\conf
    if EXIST de.dat (
        ren de.dat en.dat
        echo.
        cd %sockdir%\msg
        start /WAIT change-setting_en.vbs
        goto commandline
    )
    if EXIST en.dat (
        ren en.dat de.dat
        echo.
        cd %sockdir%\msg
        start /WAIT change-setting_en.vbs
        goto commandline
    )
)
if "%command%"=="setting get" (
    echo.
    echo  Fehler: Keine Einstellung angegeben.
    echo.
    echo  Mîgliche Einstellungen:
    echo.
    echo    - appearence
    echo    - language
    echo.
    goto commandline
)
if "%command%"=="setting get appearence" (
    cd %sockdir%\conf
    if EXIST darkmode.dat (
        echo.
        echo  Status der Einstellung 'appearence':
        echo    darkmode
        echo.
        goto commandline
    )
    if EXIST lightmode.dat (
        echo.
        echo  Status der Einstellung 'appearence':
        echo    lightmode
        echo.
        goto commandline
    )
)
if "%command%"=="setting get language" (
    cd %sockdir%\conf
    if EXIST de.dat (
        echo.
        echo  Status der Einstellung 'language':
        echo    deutsch
        echo.
        goto commandline
    )
    if EXIST en.dat (
        echo.
        echo  Status der Einstellung 'language':
        echo    englisch
        echo.
        goto commandline
    )
)
echo.
echo  Unbekannter Befehl, versuche 'help'
echo.
goto commandline

:cmd3259
color %colors%
goto commandline