@echo off
setlocal

:: Direktlink zur Datei im neuesten GitHub-Release
set "fileUrl=https://github.com/Simzahn001/ortwein-zitat/releases/latest/download/Ortweinzitat.xsl"

:: Zielverzeichnis für Word-Zitationsstile
set "targetDir=%APPDATA%\Microsoft\Bibliography\Style"

:: Dateiname
set "fileName=Ortweinzitat.xsl"

:: Herunterladen der Datei mit PowerShell
echo Lade Datei herunter...
powershell -Command "Invoke-WebRequest -Uri '%fileUrl%' -OutFile '%fileName%'"

:: Prüfen, ob Zielverzeichnis existiert
if not exist "%targetDir%" (
    echo Zielverzeichnis existiert nicht. Erstelle es...
    mkdir "%targetDir%"
)

:: Datei verschieben
echo Verschiebe Datei nach %targetDir%...
move /Y "%fileName%" "%targetDir%\%fileName%"

echo Fertig! Der Zitierstil ist jetzt in Word verfügbar.
pause
