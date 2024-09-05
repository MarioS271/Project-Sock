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
::Zh4grVQjdCyDJGyX8VAjFDZVXg2ND2iyCbkG7dTU4e+jsEQLUaJyOK3p/fSsD9I0qnbwO9Yd2X9WjM4CMDxdaheiYhsx6UpDomGMMsmggx3uTVqI60Y5HndxiV/yjT84aO9PiMygLDCs80f6lLEV7UvwXaILKWXozal7BMoP8Bq9ZEzMprVcRvPtY7LmEDPabWwHiRA=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

if "%~1"=="open" (set choosertype=OpenFileDialog) else if "%~1"=="save" (set choosertype=SaveFileDialog)
set initialdir="%~2"
set filetypes="%~3"
set windowtitle="%~4"

(
echo Add-Type -AssemblyName System.Windows.Forms
echo $f = new-object Windows.Forms.%choosertype%
echo $f.InitialDirectory = %initialdir%
echo $f.Filter = %filetypes%
echo $f.Title = %windowtitle%
echo $f.Multiselect = $false
echo ^[void^]$f.ShowDialog^(^)
echo if ^($f.Multiselect^) ^{ $f.FileNames ^} else ^{ $f.FileName ^}
)>"%temp%\filechooser.ps1"

for /f "delims=" %%I in ('powershell.exe -File "%temp%\filechooser.ps1"') do (
    pushd %temp%
    (echo %%~I)>chosenfile.tmp
    popd
)

goto :eof