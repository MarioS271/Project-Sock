::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMprpWRfigYr7mYw==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMprVaRfLRb7inBi7NQw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off & setlocal
pushd %temp%

if not exist food_de.hta (
(
echo ^<!DOCTYPE html^>
echo ^<meta http-equiv="X-UA-Compatible" content="ie=9"/^>
echo ^<script^>
echo     resizeTo^(0, 0^);
echo     window.offscreenBuffering = ^"true^";
echo ^</script^>
echo ^<title^>Food^</title^>
echo ^<hta:application
echo     ID=^"food_window^"
echo     applicationname=^"food_window^"
echo     BORDER=^"none^"
echo     selection=^"no^"
echo     scroll=^"no^"
echo     icon=^"C:/Users/%username%/Assistants/Sock/icon.ico^"
echo     showInTaskBar=^"no^"
echo     singleinstance=^"no^"
echo /^>
echo ^<html^>
echo     ^<style^>
echo         body ^{
echo             margin-top: 100px;
echo             background-image: url^(^"C:/Users/%username%/Assistants/Sock/apps/catch_the_food/food.png^"^);
echo             background-color: White;
echo             background-size: cover;
echo             background-repeat: no-repeat;
echo             background-position: center;
echo             color: black;
echo             cursor: pointer;
echo         ^}
echo         button ^{
echo             position: absolute;
echo             top: 10px;
echo             text-align: center;
echo             align: center;
echo             background-color: #393939;
echo             border: none;
echo             color: white;
echo             padding: 8px 18px;
echo             text-align: center;
echo             text-decoration: none;
echo             display: inline-block;
echo             font-size: 14px;
echo             cursor: pointer;
echo             border-radius: 20px;
echo         ^}
echo         button:hover ^{
echo             background-color: #696969;
echo         ^}
echo     ^</style^>
echo     ^<script^>
echo         var timer, z, c, dX, dY, tOut;
echo         x = window.screenLeft;
echo         y = window.screenLeft;
echo         size = 100;
echo         maxMove = 5;
echo         cps = 1000 / 30;
echo         maxX = screen.availWidth - size;
echo         maxY = screen.availHeight - size;
echo         function init^(^) ^{
echo             resizeTo^(size, size^);
echo             moveTo^(x, y^);
echo             randomTOut^(^);
echo             flee^(^);
echo             closeDetect^(^);
echo             runningCheck^(^);
echo         ^}
echo         function randomTOut^(^) ^{
echo             tOut = ^(Math.round^(Math.random^(^) * 480^) + 20^) * 10;
echo             moveControl^(^);
echo             timer = setTimeout^(function ^(^) ^{
echo                 randomTOut^(^);
echo             ^}, tOut^);
echo         ^}
echo         function moveControl^(^) ^{
echo             dX = Math.round^(Math.random^(^) * maxMove * 2 - maxMove^);
echo             dY = Math.round^(Math.random^(^) * maxMove * 2 - maxMove^);
echo         ^}
echo         function flee^(^) ^{
echo             z = setInterval^(function ^(^) ^{
echo                 if ^(x ^> 0^) ^{
echo                     x += dX;
echo                 ^} else ^{
echo                     dX = Math.abs^(dX^);
echo                     x += dX;
echo                 ^}
echo                 if ^(y ^> 0^) ^{
echo                     y += dY;
echo                 ^} else ^{
echo                     dY = Math.abs^(dY^);
echo                     y += dY;
echo                 ^}
echo                 if ^(x ^< maxX^) ^{
echo                     x += dX;
echo                 ^} else ^{
echo                     dX = -Math.abs^(dX^);
echo                     x += dX;
echo                 ^}
echo                 if ^(y ^< maxY^) ^{
echo                     y += dY;
echo                 ^} else ^{
echo                     dY = -Math.abs^(dY^);
echo                     y += dY;
echo                 ^}
echo                 moveTo^(x, y^);
echo             ^}, cps^);
echo         ^}
echo         function closeDetect^(^) ^{
echo             c = setInterval^(function ^(^) ^{
echo                 testForCloseEvent^(^);
echo             ^}, 1^);
echo         ^}
echo         function runningCheck^(^) ^{
echo             s = setInterval^(function ^(^) ^{
echo                 gamecheckforrunning^(^);
echo             ^}, 1^);
echo         ^}
echo         function closeW^(^) ^{
echo             clearTimeout^(timer^);
echo             clearInterval^(z^);
echo             clearInterval^(c^);
echo             clearInterval^(s^);
echo             close^(^);
echo         ^}
echo     ^</script^>
echo     ^<script type=^"text/vbscript^"^>
echo         Function testForCloseEvent^(^)
echo             Dim testFile, objFSO
echo             Set objFSO = CreateObject^(^"Scripting.FileSystemObject^"^)
echo             If ^(objFSO.FileExists^(^"C:/Users/%username%/Assistants/Sock/apps/catch_the_food/end.tmp^"^)^) Then
echo             closeW^(^)
echo             End If
echo         End Function
echo         Function gamecheckforrunning^(^)
echo             Dim testFile, objFSO, Wshell
echo             Set objFSO = CreateObject^(^"Scripting.FileSystemObject^"^)
echo             Set Wshell = CreateObject^(^"WScript.Shell^"^)
echo             If ^(objFSO.FileExists^(^"C:/Users/%username%/Assistants/Sock/apps/catch_the_food/check.tmp^"^)^) Then
echo             Wshell.Run^(^"C:/Users/%username%/Assistants/Sock/apps/catch_the_food/confirm-running.exe^"^)
echo             End If
echo         End Function
echo     ^</script^>
echo     ^<body onload=^"init^(^)^"^>
echo     ^<button onclick=^"closeW^(^)^"^>
echo          Sammeln
echo     ^</button^>
echo     ^</body^>
echo ^</html^>
)>food_de.hta
)
start %sockdir%\lib\scripts\launchontop.exe mshta.exe %temp%\food_de.hta

popd
goto :eof