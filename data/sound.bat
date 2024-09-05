::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMpqBaX/jqJbjxBlY=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
pushd %temp%

if "%~1"=="" (goto err) else if not exist "%~1" (goto err)
if not "%~2"=="" if not "%~2"=="wait" (goto err)

(
echo Set Sound = CreateObject^(^"WMPlayer.OCX.7^"^)
echo Sound.URL = "%~1"
echo Sound.Controls.play
echo do while Sound.currentmedia.duration = 0
echo wscript.sleep 100
echo loop
echo wscript.sleep ^(int^(Sound.currentmedia.duration^)+1^)*1000
)>snd.vbs
if "%~2"=="wait" (
    start /WAIT snd.vbs
    del snd.vbs
) else (
    start %sockdir%\lib\bghost.exe snd.vbs,%temp%
)

:end
popd
goto :eof

:err
(
echo MsgBox "argument error (did you forget quotation marks? / does your file exist?)",16,"sound.exe - Error"
)>msg.vbs
start /WAIT msg.vbs
del msg.vbs
goto end