@echo off
chcp 65001 >nul
title Rexar Neural AI Translation Platform
cls
echo ==============================================================================
echo        Rexar Neural AI Translation Platform — One-Click Launcher
echo ==============================================================================
echo.

:: 1. Check if Docker is installed and running
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not running or not installed on this computer!
    echo Please start Docker Desktop first, then run start.bat again.
    echo.
    echo If you don't have Docker installed, download it free from:
    echo https://www.docker.com/products/docker-desktop
    echo.
    pause
    exit /b 1
)

:: 2. Ensure data directory exists
if not exist "data" mkdir data

echo [1/2] Pulling and launching Rexar Translation containers...
docker compose up -d

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to start Docker containers. Please check error message above.
    pause
    exit /b 1
)

echo.
echo [2/2] Launching Rexar Translation in your default browser...
timeout /t 3 /nobreak >nul
start http://localhost:38983

echo.
echo ==============================================================================
echo [SUCCESS] Rexar Translation is now running at: http://localhost:38983
echo To stop the platform at any time, run: docker compose down
echo ==============================================================================
echo.
pause
