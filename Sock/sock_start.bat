@echo off & setlocal
mode con cols=120 lines=30
set sockdir=%userprofile%\Assistants\Sock
:start_selector
cd %sockdir%\conf
if EXIST configured.dat (
goto conf_restore
)	else (
goto first_start
)


:first_start
title Assistant Sock - First start
echo Welcome to the Assistant "Sock"!
timeout 1 >nul
echo.
echo How it looks like, you are running this assistant the first time.
echo Through this, you have to specify some things. 
timeout 2 >nul
title Assistant Sock - Configuration
set r_key=%random%%random%%random%%random%%random%%random%%random%%random%
echo.
cd ..
echo %r_key%>Activation_Key.txt
:enter_key
echo So, first you have to activate this product. Please enter the correct key.
timeout 1 >nul
start Activation_Key.txt
set /P key=ACTIVATION KEY: 
if "%key%"=="%r_key%" (
taskkill /f /im notepad.exe
del Activation_Key.txt
cd conf
cls
echo Great! You have now activated this product for use. Now, please select your language.
timeout 2 >nul
goto int_L
)	else (
echo This is not the Key!
timeout 2 >nul
goto enter_key
)


:re-configurate
title Assistant Sock - Re-configuration
del configured.dat
del en.dat
del de.dat
del %userprofile%\Desktop\Sock.lnk
del %userprofile%\Desktop\Socke.lnk
cls
echo Welcome to the Assistant "Sock"!
timeout 1 >nul
echo.
echo We're sorry for that, but an error ocurred while reading the configuration. You must re-configurate this now.
echo Now, you have to specify some things. 
timeout 2 >nul
title Assistant Sock - Configuration
echo.
echo.
echo You are re-configuration right now, so you don't have to enter the activation key.
timeout 2 >nul
cls
echo So, please select your language now.
timeout 2 >nul
goto int_L


:int_L
set L1=[X]
set L2=   
:rewrite_L
cls
echo.
echo Navigate with [W] (Up) and [S] (Down), select the highlithed Option with [Q].
echo.
echo.
echo                +------------------------+
echo                I   %L1%  ENGLISH  %L1%    I
echo                +------------------------+
echo.
echo                +------------------------+
echo                I   %L2%  DEUTSCH  %L2%    I
echo                +------------------------+
choice /N /C WSQ
if errorlevel 255 goto rewrite_L
if errorlevel 3 goto select_L
if errorlevel 2 goto down_L
if errorlevel 1 goto up_L
if errorlevel 0 goto rewrite_L

:down_L
if "%L1%"=="[X]" set L1=   &&set L2=[X]&&goto rewrite_L
goto rewrite_L

:up_L
if "%L2%"=="[X]" set L2=   &&set L1=[X]&&goto rewrite_L
goto rewrite_L

:select_L
if "%L1%"=="[X]" cls&&goto configured-en
if "%L2%"=="[X]" cls&&goto configured-de
goto rewrite_L


:configured-en
echo {DATA}>configured.dat
echo {DATA}>en.dat
echo {DATA}>darkmode.dat
title Assistant Sock - Configured
del %userprofile%\Desktop\Sock-Installation.lnk
cd %sockdir%\lnk
xcopy Sock.lnk %userprofile%\Desktop
cd %sockdir%\window
cls
echo Cool! You are now ready to use your personal Assistant.
timeout 2 >nul
LaunchOnTop.exe mshta.exe %sockdir%\window\sock_window-en.hta
start welcome_en.lnk
exit


:configured-de
echo {DATA}>configured.dat
echo {DATA}>de.dat
echo {DATA}>darkmode.dat
title Assistent Socke - Konfiguriert
del %userprofile%\Desktop\Sock-Installation.lnk
cd %sockdir%\lnk
xcopy Socke.lnk %userprofile%\Desktop
cd %sockdir%\window
cls
echo Cool! Jetzt bist du bereit, deinen pers”nlichen Assistenten zu benutzen.
timeout 2 >nul
LaunchOnTop.exe mshta.exe %sockdir%\window\sock_window-de.hta
start welcome_de.lnk
exit


:conf_restore
title Assistant Sock - Loading Configuration...
echo Reading...
if EXIST en.dat (
cls
goto config-en
)
if EXIST de.dat (
cls
goto config-de
)
cls
echo ERR: Configuration File(s) corrupted or missing
cd %sockdir%\msg
start error_corrupted-configuration.vbs
timeout 2 >nul
taskkill -f -im wscript.exe
goto re-configurate


:config-en
title Assistant Sock - Ready
cd %sockdir%\window
LaunchOnTop.exe mshta.exe %sockdir%\window\sock_window-en.hta
exit


:config-de
title Assistent Socke - Bereit
cd %sockdir%\window
LaunchOnTop.exe mshta.exe %sockdir%\window\sock_window-de.hta
exit