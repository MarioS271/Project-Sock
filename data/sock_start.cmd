::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMpqBaSf3ReKnoESKGJnEa7A==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off & setlocal
mode con cols=35 lines=2
title Sock
echo Loading...
set button=%sockdir%\lib\button\Button.bat 
set GetInput=%sockdir%\lib\button\GetInput.exe
cd %sockdir%\lib\scripts
setx.exe sockdir "%userprofile%\Assistants\Sock"
goto start_selector

:start_selector
cd %temp%
if EXIST %temp%/pwr.dat (
    pushd %sockdir%/conf
    (set /p lang=)<lang.dat
    popd
    if "%lang%"=="en" (goto pin_wrong-en) else if "%lang%"=="de" (goto pin_wrong-de)
)
cd %sockdir%/conf
if EXIST conf.dat (
    goto conf_restore
) else (
    goto first_start
)


:first_start
mode con cols=52 lines=12
title Assistant Sock - Configuration
echo Welcome to Assistant Sock!
timeout 1 /nobreak >nul
echo.
echo First, please select your language.
timeout 2 /nobreak >nul
goto lang_select

:re-configurate
title Assistant Sock - Re-configuration
cd %sockdir%\conf
del *
cls
echo Welcome to Assistant Sock!
timeout 1 /nobreak >nul
echo.
echo We're sorry for that, but there was corrupted or faulty configuration found.
timeout 2 /nobreak >nul
goto lang_select


:lang_select
cls
echo First, please select your language.
call %button% 14 4 "     ENGLISH      " 14 8 "     DEUTSCH      " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 goto passwd-set_en
if %errorlevel%==2 goto passwd-set_de

:passwd-set_en
cls
echo Do you want to set a PIN too?
echo.
call %button% 14 4 "        YES       " 14 8 "        NO        " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 set pin=&&set vpin=&&goto set-fpasswd_en
if %errorlevel%==2 call :configured en no %tformat%
:set-passwd_en
if "%vpin%"=="******" (set pin=%pin:~0,-1%&&set vpin=%vpin:~0,-1%&&goto set-passwd_en)
:set-fpasswd_en
cls
echo Please enter a PIN.
echo.
echo PIN: %vpin%
call %GetInput%
if %errorlevel%==48 set pin=%pin%0&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==49 set pin=%pin%1&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==50 set pin=%pin%2&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==51 set pin=%pin%3&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==52 set pin=%pin%4&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==53 set pin=%pin%5&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==54 set pin=%pin%6&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==55 set pin=%pin%7&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==56 set pin=%pin%8&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==57 set pin=%pin%9&&set vpin=%vpin%*&&goto set-passwd_en
if %errorlevel%==8 if "%pin%" neq "" (set pin=%pin:~0,-1%&&set vpin=%vpin:~0,-1%&&goto set-passwd_en) else (goto set-passwd_en)
if %errorlevel%==13 if "%vpin%"=="*****" (call :configured en yes %tformat% %pin%) else (%sockdir%\lib\&&set pin=&&set vpin=&&goto set-passwd_en)
goto set-passwd_en

:passwd-set_de
cls
echo Willst du auch eine PIN festlegen?
echo.
call %button% 14 4 "        JA        " 14 8 "       NEIN       " # Press
call %GetInput% /m %Press% /h 70
if %errorlevel%==1 set pin=&&set vpin=&&goto set-fpasswd_de
if %errorlevel%==2 call :configured de no %tformat%
:set-passwd_de
if "%vpin%"=="******" (set pin=%pin:~0,-1%&&set vpin=%vpin:~0,-1%&&goto set-passwd_de)
:set-fpasswd_de
cls
echo Bitte lege eine PIN fest.
echo.
echo PIN: %vpin%
call %GetInput%
if %errorlevel%==48 set pin=%pin%0&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==49 set pin=%pin%1&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==50 set pin=%pin%2&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==51 set pin=%pin%3&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==52 set pin=%pin%4&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==53 set pin=%pin%5&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==54 set pin=%pin%6&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==55 set pin=%pin%7&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==56 set pin=%pin%8&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==57 set pin=%pin%9&&set vpin=%vpin%*&&goto set-passwd_de
if %errorlevel%==8 (if "%pin%" neq "" (set pin=%pin:~0,-1%&&set vpin=%vpin:~0,-1%&&goto set-passwd_de) else (goto set-passwd_de))
if %errorlevel%==13 (if "%vpin%"=="*****" (call :configured en yes %tformat% %pin%) else (msg %username% Please enter a valid PIN.&&set pin=&&set vpin=&&goto set-passwd_de))
goto set-passwd_de


:configured
set lang=%~1
set passwd=%~2
set password=%~3
cd %sockdir%\conf
(
echo none
echo -
)>homebtn.dat
echo default>sockimg.dat
if %lang% == en echo en>lang.dat
if %lang% == de echo de>lang.dat
if %passwd% == yes (
    (
    echo n
    echo %password%
    echo n
    )>>conf.dat
) else (
    (
    echo n
    echo n
    echo n
    )>>conf.dat
)
if "%lang%"=="en" (
    title Assistant Sock - Configured
    cd %sockdir%\lnk
    xcopy Sock.lnk "%userprofile%\Desktop"
    xcopy Sock.lnk "%appdata%\Microsoft\Windows\Start Menu\Programs"
    cd "%sockdir%\window"
    cls
    echo Cool! You are now ready to use
    echo your personal Assistant.
    timeout 2 /nobreak >nul
    start https://sock.marios271.net/en/welcome
    start %sockdir%\window\sock_window-en.exe
    exit
) else if "%lang%"=="de" (
    title Assistent Socke - Konfiguriert
    cd %sockdir%\lnk
    xcopy Socke.lnk "%userprofile%\Desktop"
    xcopy Socke.lnk "%appdata%\Microsoft\Windows\Start Menu\Programs"
    cd "%sockdir%\window"
    cls
    echo Cool! Jetzt bist du bereit,
    echo deinen pers”nlichen Assistenten zu benutzen.
    timeout 2 /nobreak >nul
    start https://sock.marios271.net/de/welcome
    start %sockdir%\window\sock_window-de.exe
    exit
)


:conf_restore
mode con cols=35 lines=2
echo Reading...
cd %sockdir%\conf
(set /p windowcolor=)<theme.dat
color %windowcolor%
(set /p lang=)<lang.dat
if "%lang%"=="en" (goto startup_en)
if "%lang%"=="de" (goto startup_de)
cls
start %sockdir%\lib\msg.exe "The configuration is corrupted or missing. You must re-configurate now.",64,"Critical Error"
goto re-configurate


:startup_en
set /a wait_time=1
(
set /p debug=
set /p password=
)<conf.dat
if not "%password%"=="n" (
    (
    set /p debug=
    set /p password=
    )<conf.dat
    if "%debug%"=="y" (mode con cols=35 lines=9) else (mode con cols=35 lines=5)
    set pin=
    set vpin=
    goto pin_first-write_en
    :pin-rewrite_en
    if "%pin%"=="%password%" goto launch_en
    if "%vpin%"=="*****" goto pin-wrong_en
    :pin_first-write_en
    title Enter PIN
    cls
    echo Please enter your PIN:
    echo.
    echo PIN: %vpin%
    if "%debug%"=="y" (
        echo RPIN %pin%
        echo SPIN %password%
        echo.
        echo LKEY %errorlevel%
    )
    call %GetInput%
    if %errorlevel%==48 set pin=%pin%0&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==49 set pin=%pin%1&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==50 set pin=%pin%2&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==51 set pin=%pin%3&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==52 set pin=%pin%4&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==53 set pin=%pin%5&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==54 set pin=%pin%6&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==55 set pin=%pin%7&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==56 set pin=%pin%8&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==57 set pin=%pin%9&&set vpin=%vpin%*&&goto pin-rewrite_en
    if %errorlevel%==8 (if "%pin%" neq "" (set pin=%pin:~0,-1%&&set vpin=%vpin:~0,-1%&&goto pin-rewrite_en)) else (goto pin-rewrite_en)
    goto pin-rewrite_en

    :pin-wrong_en
    title Wrong PIN
    set pin=
    set vpin=
    pushd %temp%
    if exist pwr.tmp if not "%pinwreg%"=="true" (
        (set /p rwaittime=)<pwr.tmp
        set waittime=%rwaittime%
    ) else (
        set pinwreg=true
        (echo %waittime%>pwr.tmp)
    )
    popd
    cls
    echo The PIN you entered is wrong.
    echo The assistant will now be locked
    echo for %wait_time% minute^(s^).
    set /a waittime=60 * %wait_time%
    timeout %waittime% /nobreak >nul
    set /a wait_time=%wait_time% * 2
    if exist pwr.tmp (del pwr.tmp)
    goto pin-rewrite_en
)
:launch_en
cls
title Assistant Sock - Ready
cd %sockdir%\window
start %sockdir%\window\sock_window-en.exe
exit

:startup_de
set /a wait_time=1
(
set /p debug=
set /p password=
)<conf.dat
if not "%password%"=="n" (
    if "%debug%"=="y" (mode con cols=35 lines=9) else (mode con cols=35 lines=5)
    set pin=
    set vpin=
    (
    set /p debug=
    set /p password=
    )<conf.dat
    goto pin_first-write_de
    :pin-rewrite_de
    if "%pin%"=="%password%" goto launch_de
    if "%vpin%"=="*****" goto pin-wrong_de
    :pin_first-write_de
    title PIN-Eingabe
    cls
    echo Bitte gib deine PIN ein:
    echo.
    echo PIN: %vpin%
    if "%debug%"=="y" (
        echo RPIN %pin%
        echo SPIN %password%
        echo.
        echo LKEY %errorlevel%
    )
    call %GetInput%
    if %errorlevel%==48 set pin=%pin%0&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==49 set pin=%pin%1&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==50 set pin=%pin%2&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==51 set pin=%pin%3&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==52 set pin=%pin%4&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==53 set pin=%pin%5&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==54 set pin=%pin%6&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==55 set pin=%pin%7&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==56 set pin=%pin%8&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==57 set pin=%pin%9&&set vpin=%vpin%*&&goto pin-rewrite_de
    if %errorlevel%==8 (if "%pin%" neq "" (set pin=%pin:~0,-1%&&set vpin=%vpin:~0,-1%&&goto pin-rewrite_de)) else (goto pin-rewrite_de)
    goto pin-rewrite_de

    :pin-wrong_de
    title Falsche PIN
    set pin=
    set vpin=
    pushd %temp%
    if exist pwr.tmp if not "%pinwreg%"=="true" (
        (set /p rwaittime=)<pwr.tmp
        set waittime=%rwaittime%
    ) else (
        set pinwreg=true
        (echo %waittime%>pwr.tmp)
    )
    popd
    cls
    echo Die eingegebene PIN ist falsch.
    echo Der Assistent ist nun fr %wait_time%
    echo Minute^(n^) gesperrt.
    set /a waittime=60 * %wait_time%
    timeout %waittime% /nobreak >nul
    set /a wait_time=%wait_time% * 2
    goto pin-rewrite_de
)
:launch_de
cls
title Assistent Socke - Bereit
cd %sockdir%\window
start %sockdir%\window\sock_window-de.exe
exit