@echo off
chcp 65001 >nul
title Rexar Neural AI Translation Platform
cls
echo ==============================================================================
echo        Rexar Neural AI Translation Platform — Local Desktop Launcher
echo ==============================================================================
echo.
echo [1/3] Starting Local LLM Engine (llama-server on port 38985)...
start "Rexar Local Engine [Port 38985]" cmd /k "server.exe -m qwen2.5-3b-instruct-q4_k_m.gguf -c 2048 --port 38985"

echo [INFO] Waiting 3 seconds for local engine initialization...
timeout /t 3 /nobreak >nul

echo [2/3] Starting Rexar High-Speed Go Gateway (Port 38984)...
start "Rexar Gateway [Port 38984]" cmd /k "gateway.exe"

echo [INFO] Waiting 2 seconds for gateway binding...
timeout /t 2 /nobreak >nul

echo [3/3] Starting Rexar Interactive Web UI (Port 38983)...
start "Rexar Web UI [Port 38983]" cmd /k "cd translate-ui && npm run dev"

echo.
echo ==============================================================================
echo [SUCCESS] All 3 Rexar Translation services have been launched!
echo Access the web interface at: http://localhost:38983
echo ==============================================================================
echo.
pause
