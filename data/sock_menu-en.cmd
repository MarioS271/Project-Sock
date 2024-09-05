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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMpqBaSf3RZrjnFnvNLScalHWj
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
goto menu


:menu
mode con cols=66 lines=30
set btn1-hght=12
set btn2-hght=16
set btn3-hght=20
set btn4-hght=25
(
set /p conf_btn-type=
set /p conf_btn-param=
)<homebtn.dat
if "%conf_btn-type%"=="none" (
    set conf_btn-text="            ---             "
)
if "%conf_btn-type%"=="app" (
    if "%conf_btn-param%"=="explorer" (set conf_btn-text="          EXPLORER          ")
    if "%conf_btn-param%"=="notepad" (set conf_btn-text="           NOTEPAD          ")
    if "%conf_btn-param%"=="paint" (set conf_btn-text="           PAINT            ")
    if "%conf_btn-param%"=="clock" (set conf_btn-text="           CLOCK            ")
    if "%conf_btn-param%"=="text_editor" (set conf_btn-text="         TEXT EDITOR        ")
    if "%conf_btn-param%"=="catch_the_food" (set conf_btn-text="       CATCH THE FOOD       ")
)
if "%conf_btn-type%"=="weather" (
    set conf_btn-text="           WEATHER          "
)
if "%conf_btn-type%"=="website" (
    set conf_btn-text="           WEBSITE          "
)
if "%conf_btn-type%"=="file" (
    set conf_btn-text="            FILE            "
)
if "%conf_btn-type%"=="shutdown" (
    set conf_btn-text="          SHUTDOWN          "
)
title Assistant Sock - Menu
cls
cd %sockdir%\conf
(
set /p terminalenabled=
)<conf.dat
if "%terminalenabled%"=="y" (
    mode con cols=66 lines=32
    set btn1-hght=14
    set btn2-hght=18
    set btn3-hght=22
    set btn4-hght=27
    echo Press T to call the terminal.
    echo.
)
cd %sockdir%
echo     __          __    __________    __
echo     ^| \        / ^|    ^|             ^| \      ^|    ^|         ^|     
echo     ^|  \      /  ^|    ^|             ^|  \     ^|    ^|         ^|
echo     ^|   \    /   ^|    ^|_________    ^|   \    ^|    ^|         ^|
echo     ^|    \__/    ^|    ^|             ^|    \   ^|    ^|         ^|
echo     ^|            ^|    ^|             ^|     \  ^|    \         /
echo     ^|            ^|    ^|_________    ^|      \_^|     \_______/ 
echo.
echo.
echo                    What would you like to do?
echo.
echo.
call %button% 16 %btn1-hght% "            APPS            " 16 %btn2-hght% %conf_btn-text% 16 %btn3-hght% "          SETTINGS          " 16 %btn4-hght% "            EXIT            " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==116 (
    cd %sockdir%\conf
    (set /p terminalenabled=)<conf.dat
    if "%terminalenabled%"=="y" (goto terminal)
)
if %errorlevel%==32 "%sockdir%/lib/scripts/slidetoshutdown.exe"
if %errorlevel%==1 goto apps
if %errorlevel%==2 goto conf_btn
if %errorlevel%==3 goto settings
if %errorlevel%==4 exit
goto menu

:apps
mode con cols=54 lines=30
title Assistant Sock - Apps
cls
echo.
echo                          APPS
echo           Press ESC to get back to the menu.
echo.
echo.
call %button% 10 5 "            EXPLORER          " 10 9 "            NOTEPAD           " 10 13 "             PAINT            " 10 17 "             CLOCK            " 10 21 "          TEXT EDITOR         " 10 25 "        CATCH THE FOOD        " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 goto menu
if %errorlevel%==1 "explorer.exe&&goto menu"
if %errorlevel%==2 "notepad.exe&&goto menu"
if %errorlevel%==3 "mspaint.exe&&goto menu"
if %errorlevel%==4 "%sockdir%\apps\clock\clock_en.exe&&goto menu"
if %errorlevel%==5 "%sockdir%\apps\text-editor\texteditor_en.exe&&goto menu"
if %errorlevel%==6 "%sockdir%\apps\catch_the_food\food_game-en.exe&&goto menu"
goto apps


:conf_btn
if "%conf_btn-type%"=="app" (
    if "%conf_btn-param%"=="explorer" "explorer.exe"
    if "%conf_btn-param%"=="notepad" "notepad.exe"
    if "%conf_btn-param%"=="paint" "mspaint.exe"
    if "%conf_btn-param%"=="clock" "%sockdir%\apps\clock\clock_en.exe"
    if "%conf_btn-param%"=="text_editor" "%sockdir%\apps\text-editor\texteditor_en.exe"
    if "%conf_btn-param%"=="catch_the_food" "%sockdir%\apps\catch_the_food\food_game-en.exe"
)
if "%conf_btn-type%"=="weather" (
    start https://weather.com/
)
if "%conf_btn-type%"=="website" (
    start %conf_btn-param%
)
if "%conf_btn-type%"=="file" (
    start %conf_btn-param%
)
if "%conf_btn-type%"=="shutdown" (
    "%sockdir%/lib/scripts/slidetoshutdown.exe"
)
goto menu


:settings
mode con cols=64 lines=24
title Assistant Sock - Settings
cd %sockdir%\conf
(set /p lang=)<lang.dat
if "%lang%"=="en" set setting1status=ENGLISH
if "%lang%"=="de" set setting1status=GERMAN
(
set /p tmps1=
set /p tmps2=
set /p launchonstart=
)<conf.dat
if "%launchonstart%"=="n" set setting2status=NO
if "%launchonstart%"=="y" set setting2status=YES
(set /p windowtheme=)<theme.dat
set setting3status=CUSTOM
if "%windowtheme%"=="0f" set setting3status=DARK MODE
if "%windowtheme%"=="f0" set setting3status=LIGHT MODE
cls
echo.
echo                          SETTINGS      
echo.
echo            To get back to the menu, press ESC.
echo.
echo.
echo.
echo                                               [ %setting1status% ]
echo.
echo.
echo.
echo                                               [ %setting2status% ]
echo.
echo.
echo.
echo                                               [ %setting3status% ]
echo.
echo.
echo.
call %button% 8 6 "          LANGUAGE          " 8 10 "        START ON BOOT       " 8 14 "         APPEARANCE         " 8 20 "        MORE OPTIONS        " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 goto menu
if %errorlevel%==1 goto changesetting1
if %errorlevel%==2 goto changesetting2
if %errorlevel%==3 goto changesetting3
if %errorlevel%==4 goto moreoptions_settings
goto settings

:changesetting1
if "%setting1status%"=="ENGLISH" (
    cd %sockdir%\conf
    (echo de)>lang.dat
    %sockdir%\lib\msg.exe "You need to restart the assistant to apply this change.",64,"Settings"
    cd %userprofile%\Desktop
    if EXIST Sock.lnk ren Sock.lnk Socke.lnk
    cd "%appdata%\Microsoft\Windows\Start Menu\Programs"
    if EXIST Sock.lnk ren Sock.lnk Socke.lnk
    goto settings
)
if "%setting1status%"=="GERMAN" (
    cd %sockdir%\conf
    (echo en)>lang.dat
    %sockdir%\lib\msg.exe "You need to restart the assistant to apply this change.",64,"Settings"
    cd %userprofile%\Desktop
    if EXIST Socke.lnk ren Socke.lnk Sock.lnk
    cd "%appdata%\Microsoft\Windows\Start Menu\Programs"
    if EXIST Socke.lnk ren Socke.lnk Sock.lnk
    goto settings
)
goto settings

:changesetting2
set startshell="%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
if "%setting2status%"=="YES" (
    cd %sockdir%\conf
    (
    set /p tmps1=
    set /p tmps2=
    )<conf.dat
    (
    echo %tmps1%
    echo %tmps2%
    echo n
    )>conf.dat
    cd %startshell%
    del Sock.lnk
    goto settings
)
if "%setting2status%"=="NO" (
    cd %sockdir%\conf
    (
    set /p tmps1=
    set /p tmps2=
    )<conf.dat
    (
    echo %tmps1%
    echo %tmps2%
    echo y
    )>conf.dat
    cd %sockdir%\lnk
    xcopy Sock.lnk %startshell%
    goto settings
)
goto settings

:changesetting3
if "%setting3status%"=="DARK MODE" (
    cd %sockdir%\conf
    (echo f0)>theme.dat
    start %sockdir%\lib\msg.exe "You need to restart all menus for this to take effect.",64,"Settings"
    goto settings
)
if "%setting3status%"=="LIGHT MODE" (
    cd %sockdir%\conf
    (echo 0f)>theme.dat
    start %sockdir%\lib\msg.exe "You need to restart all menus for this to take effect.",64,"Settings"
    goto settings
)
if "%setting3status%"=="CUSTOM" (
    start %sockdir%\lib\msg.exe "You need to change this setting with the theme changing utility!",48,"Settings"
    goto settings
)
goto settings


:moreoptions_settings
mode con cols=64 lines=32
title Assistant Sock - Settings / More Options
cls
echo.
echo                     SETTINGS / MORE OPTIONS
echo.
echo          To get back to the settings menu, press ESC.
echo.
call %button% 14 5 "       SHOW VERSIONS        " 14 9 "    CONFIGURE HOME BUTTON   " 14 13 "          DEVLIST           " 14 17 "         CHANGE PIN         " 14 21 "      CHANGE SOCK IMAGE     " 14 28 "         UNINSTALL          " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 goto settings
if %errorlevel%==100 goto toggle_debug
if %errorlevel%==1 goto versions_show
if %errorlevel%==2 goto change_conf-btn
if %errorlevel%==3 goto credits
if %errorlevel%==4 goto change_pin
if %errorlevel%==5 goto change_sock-img
if %errorlevel%==6 goto uninstall
goto moreoptions_settings

:versions_show
start https://github.com/MarioS271/Project-Sock/releases
goto moreoptions_settings

:credits
start https://sock.marios271.net/en/devlist
goto moreoptions_settings

:change_conf-btn
mode con cols=64 lines=28
title Assistant Sock - Configure home button
cd "%sockdir%\conf"
cls
echo.
echo                     CONFIGURE HOME BUTTON
echo.
echo          Choose what you want the home button to do.
echo            Press the spacebar to remove the current
echo                  action from the home button.
echo.
call %button% 14 8 "        OPEN AN APP         " 14 12 "      SHOW THE WEATHER      " 14 16 "       OPEN A WEBSITE       " 14 20 "         OPEN A FILE        " 14 24 "      SHUT DOWN THE PC      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 goto moreoptions_settings
if %errorlevel%==32 echo none>homebtn.dat&&echo ->>homebtn.dat&&goto moreoptions_settings
if %errorlevel%==1 goto conf_btn-app
if %errorlevel%==2 echo weather>homebtn.dat&&echo ->>homebtn.dat&&goto moreoptions_settings
if %errorlevel%==3 goto conf_btn-website
if %errorlevel%==4 goto conf_btn-file
if %errorlevel%==4 echo shutdown>homebtn.dat&&echo ->>homebtn.dat&&goto moreoptions_settings
goto moreoptions_settings
:conf_btn-app
mode con cols=64 lines=29
cls
echo.
echo             Please select the app you want to start.
echo.
echo.
call %button% 15 4 "            EXPLORER          " 15 8 "            NOTEPAD           " 15 12 "             PAINT            " 15 16 "             CLOCK            " 15 20 "          TEXT EDITOR         " 15 24 "        CATCH THE FOOD        " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 echo app>homebtn.dat&&echo explorer>>homebtn.dat&&goto moreoptions_settings
if %errorlevel%==2 echo app>homebtn.dat&&echo notepad>>homebtn.dat&&goto moreoptions_settings
if %errorlevel%==3 echo app>homebtn.dat&&echo paint>>homebtn.dat&&goto moreoptions_settings
if %errorlevel%==4 echo app>homebtn.dat&&echo clock>>homebtn.dat&&goto moreoptions_settings
if %errorlevel%==5 echo app>homebtn.dat&&echo text_editor>>homebtn.dat&&goto moreoptions_settings
if %errorlevel%==6 echo app>homebtn.dat&&echo catch_the_food>>homebtn.dat&&goto moreoptions_settings
goto conf_btn-app
:conf_btn-website
mode con cols=50 lines=7
cls
echo.
echo Please enter the website link you want to open.
echo ^(Spaces not supported^)
echo.
set /p website=https://
if "%website%"=="" (start %sockdir%\lib\msg.exe "You didn't enter a web address!",48,"Settings"&&goto conf_btn-website)
echo website>homebtn.dat
echo https://%website%>>homebtn.dat
goto moreoptions_settings
:conf_btn-file
title Select file
mode con cols=34 lines=3
cls
echo Please choose the file you
echo want to open.
start /WAIT %sockdir%\lib\filechooser.exe "open","/","All files (*.*)|*.*","Select file"
(set /p chosenfile=)<%temp%\chosenfile.tmp
if "%chosenfile%"=="" ("%sockdir%\lib\msg.exe" "The action was aborted because the file dialog was closed.",48,"Settings"&&goto moreoptions_settings)
echo file>homebtn.dat
echo %chosenfile%>>homebtn.dat
del "%temp%\chosenfile.tmp"
goto moreoptions_settings

:change_pin
mode con cols=30 lines=5
title Change PIN
cd "%sockdir%\conf"
set pin=
set vpin=
goto pin_first-rewrite
:pin_rewrite
if "%vpin%"=="******" (set pin=%pin:~0,-1%&&set vpin=%vpin:~0,-1%&&goto pin_rewrite)
:pin_first-rewrite
cls
echo Please enter a new PIN.
echo.
echo PIN: %vpin%
call %GetInput%
if %errorlevel%==48 set pin=%pin%0&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==49 set pin=%pin%1&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==50 set pin=%pin%2&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==51 set pin=%pin%3&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==52 set pin=%pin%4&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==53 set pin=%pin%5&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==54 set pin=%pin%6&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==55 set pin=%pin%7&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==56 set pin=%pin%8&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==57 set pin=%pin%9&&set vpin=%vpin%*&&goto pin_rewrite
if %errorlevel%==8 (
    if "%pin%" neq "" (
        set pin=%pin:~0,-1%
        set vpin=%vpin:~0,-1%
        goto pin_rewrite
    ) else (
        goto pin_rewrite
    )
)
if %errorlevel%==13 (
    if "%vpin%"=="*****" (
        (
        set /p tmps1=
        set /p tmps2=
        set /p tmps3=
        )<conf.dat
        goto pin_settingwrite
    ) else (
        start "%sockdir%\lib\msg.exe" "The PIN must be five characters long!",64,"Settings"
        goto pin_rewrite
    )
)
goto pin_rewrite
:pin_settingwrite
(
echo %tmps1%
echo %pin%
echo %tmps3%
)>conf.dat
goto moreoptions_settings

:change_sock-img
mode con cols=60 lines=18
title Assistant Sock - Change Sock Image
cd "%sockdir%\conf"
(
set /p cimg=
)<sockimg.dat
set state1=  
set state2=  
set state3=  
set state4=  
if "%cimg%"=="default" set state1=##
if "%cimg%"=="gray" set state2=##
if "%cimg%"=="tiger" set state3=##
if "%cimg%"=="cool" set state4=##
:rw-changeimg
cls
echo.
echo              Please select a new image for Sock. 
echo                   Exit this page with ESC.
echo.
echo.
echo.
echo     %state1%  Default
echo.
echo.
echo     %state2%  Gray
echo.
echo.
echo     %state3%  Tiger
echo.
echo.
echo     %state4%  Cool
echo.
call %button% 18 5 "     USE     " 36 5 "   PREVIEW   " 18 8 "     USE     " 36 8 "   PREVIEW   " 18 11 "     USE     " 36 11 "   PREVIEW   " 18 14 "     USE     " 36 14 "   PREVIEW   " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==27 goto moreoptions_settings
if %errorlevel%==1 (
    echo default>sockimg.dat
    pushd "%sockdir%\window"
    powershell.exe -Command "Invoke-WebRequest https://sock.marios271.net/img/default.png -OutFile sock.png"
    popd
    "%sockdir%\lib\msg.exe" "You need to restart the assistant for this to take effect.",64,"Settings"
    goto moreoptions_settings
)
if %errorlevel%==2 start https://sock.marios271.net/img/default.png&&goto change_sock-img
if %errorlevel%==3 (
    echo gray>sockimg.dat
    pushd "%sockdir%\window"
    powershell.exe -Command "Invoke-WebRequest https://sock.marios271.net/img/gray.png -OutFile sock.png"
    popd
    "%sockdir%\lib\msg.exe" "You need to restart the assistant for this to take effect.",64,"Settings"
    goto moreoptions_settings
)
if %errorlevel%==4 start https://sock.marios271.net/img/gray.png&&goto change_sock-img
if %errorlevel%==5 (
    echo tiger>sockimg.dat
    pushd "%sockdir%\window"
    powershell.exe -Command "Invoke-WebRequest https://sock.marios271.net/img/tiger.png -OutFile sock.png"
    popd
    "%sockdir%\lib\msg.exe" "You need to restart the assistant for this to take effect.",64,"Settings"
    goto moreoptions_settings
)
if %errorlevel%==6 start https://sock.marios271.net/img/tiger.png&&goto change_sock-img
if %errorlevel%==7 (
    echo cool>sockimg.dat
    pushd "%sockdir%\window"
    powershell.exe -Command "Invoke-WebRequest https://sock.marios271.net/img/cool.png -OutFile sock.png"
    popd
    "%sockdir%\lib\msg.exe" "You need to restart the assistant for this to take effect.",64,"Settings"
    goto moreoptions_settings
)
if %errorlevel%==8 start https://sock.marios271.net/img/cool.png&&goto change_sock-img
goto change_sock-img


:toggle_debug
cd %sockdir%\conf
(
set /p debug=
)<conf.dat
if "%debug%"=="y" (
    (
    set /p tmps1=
    set /p tmps2=
    set /p tmps3=
    )<conf.dat
    "%sockdir%\lib\msg.exe" "The debug mode was disabled.",64,"Settings"
    goto debug_disable-settingwrite
) else if "%debug%"=="n" (
    (
    set /p tmps1=
    set /p tmps2=
    set /p tmps3=
    )<conf.dat
    "%sockdir%\lib\msg.exe" "The debug mode was enabled.",64,"Settings"
    goto debug_enable-settingwrite
)
goto moreoptions_settings
:debug_enable-settingwrite
(
echo y
echo %tmps2%
echo %tmps3%
)>conf.dat
goto moreoptions_settings
:debug_disable-settingwrite
(
echo n
echo %tmps2%
echo %tmps3%
)>conf.dat
goto moreoptions_settings

:uninstall
cls
"%sockdir%\lib\msg.exe" "WARNING: This will erase all data from sock, so be careful what you do! You can use the official backup utility to backup and later also restore your data before doing this.",48,"Uninstall - Warning"
:rw_uninstall
mode con cols=39 lines=12
title Confirm uninstall
echo.
echo  Do you really want to uninstall Sock?
echo.
call %button% 8 4 "        YES        " 8 8 "         NO        " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto d_yes#
if %errorlevel%==2 goto moreoptions_settings
goto rw_uninstall
:d_yes
"%sockdir%\lib\msg.exe" "Not Implemented",16,"Error"
goto moreoptions_settings


:terminal
mode con cols=100 lines=30
title Assistant Sock - Terminal
cls
:commandline
echo.
set /p command=cmd ~$ 
if "%command%"=="exit" goto menu
if "%command%"=="help" (
    echo.
    echo             -- HELP --
    echo.
    echo  help          -           Shows this list.
    echo.
    echo  clear         -           Clears the console, has no 'help' parameter.
    echo.
    echo  windowcolor   -           Changes the color of the window.
    echo.
    echo  setting       -           Changes a setting.
    echo.
    echo  message       -           Make the assistant show a popup message.
    echo.
    echo  sound         -           Make the assistant play sound on your computer,
    echo                            has no 'help' parameter.
    echo.
    echo  exit          -           Exits and goes back to the main menu.
    echo.
    echo.
    goto commandline
)
if "%command%"=="clear" (
    cls
    goto commandline
)
if "%command%"=="windowcolor" (
    echo.
    echo  Parameter missing, try 'windowcolor help'
    echo.
    goto commandline
)
if "%command%"=="windowcolor help" (
    echo.
    echo  Usage of this command:
    echo.
    echo  windowcolor set
    echo    There will be a question asking to what colors to
    echo    change. Enter in this format: 'backgroundcolor''foregroundcolor'
    echo   Colors:
    echo.
    echo  0     -     Black         8     -     Grey
    echo  1     -     Blue          9     -     Light Blue
    echo  2     -     Green         a     -     Light Green
    echo  3     -     Cyan          b     -     Light Cyan
    echo  4     -     Red           c     -     Light Red
    echo  5     -     Purple        d     -     Light Purple
    echo  6     -     Yellow        e     -     Light Yellow
    echo  7     -     Light Grey    f     -     White
    echo.
    echo  windowcolor reset
    echo.
    goto commandline 
)
if "%command%"=="windowcolor set" (
    echo.
    echo  Enter the colors you would like to change to:
    echo.
    set /p color=Colors: 
    echo.
    goto cmd_color
)
if "%command%"=="windowcolor reset" (
    cd "%sockdir%\conf"
    (set /p windowcolor=)<theme.dat
    color %windowcolor%
    goto commandline
)
if "%command%"=="setting" (
    echo.
    echo  Parameter missing, try 'setting help'
    echo.
    goto commandline
)
if "%command%"=="setting help" (
    echo.
    echo  Usage of this command:
    echo.
    echo  setting change 'setting'
    echo  Changeable settings:
    echo.
    echo   - appearence
    echo   - language
    echo.
    goto commandline
)
if "%command%"=="setting change" (
    echo.
    echo  Error: No setting specified.
    echo.
    echo  Possible Settings:
    echo.
    echo    - appearence
    echo    - language
    echo.
    goto commandline
)
if "%command%"=="setting change appearence" (
    cd "%sockdir%\conf"
    (set /p windowcolor=)<theme.dat
    if "%windowcolor%"=="0f" (
        (echo f0)>theme.dat
        echo.
        "%sockdir%\lib\msg.exe" "You need to restart the assistant for this setting to take effect.",64,"Terminal"
        goto commandline
    ) else if "%windowcolor%"=="f0" (
        (echo 0f)>theme.dat
        echo.
        "%sockdir%\lib\msg.exe" "You need to restart the assistant for this setting to take effect.",64,"Terminal"
        goto commandline
    ) else (
        echo.
        "%sockdir%\lib\msg.exe" "This setting must be changed using the theme changing utility.",48,"Terminal"
    )
)
if "%command%"=="setting change language" (
    cd "%sockdir%\conf"
    (set /p lang=)<lang.dat
    if "%lang%"=="en" (
        (echo de)>lang.dat
        echo.
        "%sockdir%\lib\msg.exe" "You need to restart the assistant for this setting to take effect.",64,"Terminal"
        goto commandline
    )
    if "%lang%"=="de" (
        (echo en)>lang.dat
        echo.
        "%sockdir%\lib\msg.exe" "You need to restart the assistant for this setting to take effect.",64,"Terminal"
        goto commandline
    )
)
if "%command%"=="setting get" (
    echo.
    echo  Error: No setting specified.
    echo.
    echo  Possible Settings:
    echo.
    echo    - appearence
    echo    - language
    echo.
    goto commandline
)
if "%command%"=="setting get appearence" (
    cd "%sockdir%\conf"
    (set /p windowcolor=)<theme.dat
    if "%windowcolor%"=="0f" (
        echo.
        echo  Status of Setting 'appearence':
        echo    darkmode
        echo.
        goto commandline
    ) else if "%windowcolor%"=="f0" (
        echo.
        echo  Status of Setting 'appearence':
        echo    lightmode
        echo.
        goto commandline
    ) else (
        echo.
        echo  Status of Setting 'appearence':
        echo    custom
        echo.
        goto commandline
    )
)
if "%command%"=="setting get language" (
    cd "%sockdir%\conf"
    (set /p lang=)<lang.dat
    if "%lang%"=="de" (
        echo.
        echo  Status of Setting 'language':
        echo    german
        echo.
        goto commandline
    )
    if "%lang%"=="en" (
        echo.
        echo  Status of Setting 'language':
        echo    english
        echo.
        goto commandline
    )
)
if "%command%"=="debugmode" (
    cd "%sockdir%\conf"
    del debug.dat
    echo.
    echo The debug mode has been deactivated. Because of this, the terminal will not work anymore.
    echo Exiting terminal...
    timeout 2 /nobreak >nul
    goto menu
)
if "%command%"=="message" (
    set /p msgtext= Enter the text of the message in quotation marks: 
    set /p msgicon= Enter the icon id of the message ^(view using 'message help'^): 
    set /p msgtitle= Enter the title of the message in quotation marks: 
    echo.
    goto cmd_message
)
if "%command%"=="message help" (
    echo.
    echo Icon types:
    echo  16  -  Error icon
    echo  32  -  Question icon
    echo  48  -  Warning icon
    echo  64  -  Information icon
    echo.
    goto commandline
)
if "%command%"=="sound" (
    set /p sound= Enter file path of sound to play in quotation marks: 
    echo.
    goto cmd_sound
)
echo.
echo  Unknown command, try 'help'
echo.
goto commandline
:cmd_color
color %color%
goto commandline
:cmd_message
"%sockdir%\lib\msg.exe" %msgtext%,%msgicon%,%msgtitle%,wait
goto commandline
:cmd_sound
"%sockdir%\lib\sound.exe" %sound%,wait
goto commandline