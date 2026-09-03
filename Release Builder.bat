@echo off
setlocal

cd /d "%~dp0"

echo Erstelle module.zip...

if exist "module.zip" (
    del /f /q "module.zip"
)

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "Compress-Archive -Path 'assets','development','packs','module.json' -DestinationPath 'module.zip' -CompressionLevel Optimal"

if errorlevel 1 (
    echo.
    echo FEHLER beim Erstellen der ZIP!
    pause
    exit /b 1
)

echo.
echo module.zip erfolgreich erstellt.