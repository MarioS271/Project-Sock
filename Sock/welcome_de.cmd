@echo off & setlocal
mode con cols=95 lines=27
set sockdir=%userprofile%\Assistants\Sock
title Assistent Socke - Willkommen
echo.
echo                       _______               ______    _______     __         __  _______
echo \                  /  I         I          /         /       \    I \       / I  I
echo  \                /   I         I         /         /         \   I  \     /  I  I
echo   \      /\      /    I______   I         I         I         I   I   \   /   I  I______
echo    \    /  \    /     I         I         I         I         I   I    \_/    I  I
echo     \  /    \  /      I         I         \         \         /   I           I  I
echo      \/      \/       I______   I_______   \______   \_______/    I           I  I______
timeout 2 >nul
color 04
timeout 1 >nul
color 02
timeout 1 >nul
color 01
timeout 1 >nul
color 06
timeout 2 >nul
color 03
start /WAIT %sockdir%\sound\tada.vbs
timeout 1 >nul
color 0f
echo.
echo. 
echo Willkommen bei deinem neuen Assistenten! Ich freue mich, dass du dich fr
echo Socke entschieden haben. Er ist ein Bildschirmassistent, das heiát, dass
echo er immer ber anderen Fenstern bleibt.
echo.
echo In Sockes Fenster findest du zwei Schaltfl„chen: Die Schaltfl„che
echo 'Assistenten-Men' und die Schaltfl„che 'Hilfe'. Die erste
echo Schaltfl„che ruft das Assistentenmen auf. Es hat viele Funktionen
echo wie Einstellungen, einen App-Launcher und mehr. Die zweite
echo Schaltfl„che ruft die Hilfe auf. Du kannst dort nachsehen wenn du
echo zum Beispiel weiá nicht, wie man navigiert.
echo.
echo OK, nur noch was fr dich: In Men's kannst du mit W, S und Q navigieren.
echo W ist Hoch, S ist Runter und Q ist Ausw„hlen. Weitere Informationen dazu
echo findest du in der Hilfe.
echo.
echo Du kannst Socke auch von berall aus aufrufen, indem du einfach Strg+F2 drckst.
timeout 8 >nul
echo.
echo.
echo Drcke eine beliebu¡ge Taste zum verlassen.
pause >nul
exit