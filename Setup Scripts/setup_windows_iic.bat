@echo off

REM Create the Docker w/ DESIGNS = the directory of setup_windows.bat and DOCKER_TAG = the latest known version of the Docker image that works with LAYGO2
SET DESIGNS=%~dp0..
SET DOCKER_TAG=2023.06
call "%~dp0..\IIC-OSIC-TOOLS\start_x.bat"
