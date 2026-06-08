@echo off
chcp 65001 >nul
title Construction de l'application Inventaire Informatique
color 0A

echo.
echo  ╔══════════════════════════════════════════════════════╗
echo  ║     Inventaire Matériel Informatique - Build v1.0    ║
echo  ╚══════════════════════════════════════════════════════╝
echo.

:: Vérifier Node.js
node --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo  [ERREUR] Node.js n'est pas installé ou pas dans le PATH.
    echo  Téléchargez-le sur : https://nodejs.org
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('node --version') do set NODE_VER=%%i
echo  [OK] Node.js détecté : %NODE_VER%

:: Vérifier npm
npm --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo  [ERREUR] npm n'est pas disponible.
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('npm --version') do set NPM_VER=%%i
echo  [OK] npm détecté : v%NPM_VER%
echo.

:: Aller dans le dossier du script
cd /d "%~dp0"

echo  [1/3] Installation des dépendances npm...
echo        (Electron ~100 Mo — patience)
echo.
call npm install --prefer-offline
if errorlevel 1 (
    color 0C
    echo.
    echo  [ERREUR] npm install a échoué. Vérifiez votre connexion internet.
    pause
    exit /b 1
)
echo.
echo  [OK] Dépendances installées.
echo.

echo  [2/3] Compilation du .exe Windows (x64)...
echo.
call npm run build
if errorlevel 1 (
    color 0C
    echo.
    echo  [ERREUR] La compilation a échoué.
    pause
    exit /b 1
)
echo.
echo  [OK] Compilation terminée.
echo.

echo  [3/3] Recherche du fichier généré...
if exist "dist\*.exe" (
    echo.
    color 0A
    echo  ╔══════════════════════════════════════════════════════╗
    echo  ║  BUILD RÉUSSI !                                      ║
    echo  ║  Votre installeur .exe se trouve dans : dist\        ║
    echo  ╚══════════════════════════════════════════════════════╝
    echo.
    echo  Ouverture du dossier dist...
    explorer dist
) else (
    echo  [INFO] Le dossier dist\ a été créé. Cherchez le .exe à l'intérieur.
    if exist dist ( explorer dist )
)

echo.
pause
