@echo off & setlocal
mode con cols=95 lines=27
set sockdir=%userprofile%\Assistants\Sock
title Assistant Sock - Welcome
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
cd  %sockdir%\sound
start /WAIT tada.vbs
timeout 1 >nul
color 0f
echo.
echo.
echo Welcome to your new Assistant! I'm happy you decided for Sock. It is a
echo screen assistant, that means, that it always remains over other windows.
echo.
echo You can find two buttons in Sock's window: The 'Assistant Menu' button
echo and the 'Help' button. The first button brings up the Assistant Menu. It
echo has many features like settings, an app launcher and more.
echo The second button brings up the help. You can look there if you for
echo example don't know how to navigate.
echo.
echo OK, just one more thing for you to know: In menu's you can navigate with
echo W, S and Q. W is Up, S is Down and Q is Select. More information about
echo that you can find in the Help.
echo.
echo You can also open Sock from anywhere by simply pressing Ctrl+F2.
timeout 8 >nul
echo.
echo.
echo Press any key to exit.
pause >nul
exit