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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMpr5GTbjrc7iJ
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
pushd %temp%

if "%~1"=="" (goto err) else if "%~3"=="" (goto err)
if not %~2 EQU 16 if not %~2 EQU 32 if not %~2 EQU 48 if not %~2 EQU 64 (goto err)
if not "%~4"=="" if not "%~4"=="wait" (goto err)

(
echo MsgBox "%~1",%~2,"%~3"
)>msg.vbs
if "%~4"=="wait" (
    start /WAIT msg.vbs
    del msg.vbs
) else (
    start %sockdir%\lib\bghost.exe msg.vbs,%temp%
)

:end
popd
goto :eof

:err
(
echo MsgBox "argument error (did you forget to use quotation marks? / did you specify a valid icon id?)",16,"msg.exe - Error"
)>msg.vbs
start /WAIT msg.vbs
del msg.vbs
goto end