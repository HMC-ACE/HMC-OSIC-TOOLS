# HMC-OSIC-TOOLS
This repository aims to combine the setups of

- [IIC-OSIC-TOOLS](https://github.com/iic-jku/iic-osic-tools), a [Docker](https://www.ibm.com/topics/docker) container that includes a collection of open source integrated circuit design softwares and open source process design kit
- [laygo2_workspace_sky130](https://github.com/niftylab/laygo2_workspace_sky130); LAYGO2 is a layout generator that works with the layout tool [Magic](http://opencircuitdesign.com/magic/), and this workspace specifically works with the process design kit [SKY130](https://skywater-pdk.readthedocs.io/en/main/)

It includes scripts to

- streamline creating the IIC-OSIC-TOOLS Docker image and container, with the ability to select a version of the image that works with LAYGO2
- adjust laygo2_workspace_sky130 to be compatible with IIC-OSIC-TOOLS

Inspired by this [laygo2_docker](https://gitlab.com/mosaic_group/mosaic_laygo2/laygo2_docker) repo.

## Installation Guide (Windows)
Feel free to skip any steps if you already have some of these installed. Make sure your computer has at least ~20 GB of free space (for the IIC-OSIC-TOOLS Docker image)!

### Git
1. Install Git for Windows from [here](https://git-scm.com/download/win). Keep the default settings for installation.

### Windows Subsystem for Linux (WSL 2)
[WSL 2](https://learn.microsoft.com/en-us/windows/wsl/about) allows you to run a Linux environment within a Windows machine.

1. Open the Control Panel and navigate to Programs -> Programs and Features.
2. Select "Turn Windows features on or off" in the left panel, check "Windows Subsystem for Linux", and click "OK".
3. Open the Windows Powershell as an administrator.
4. Run the following commands:

    `wsl.exe --update`

    `wsl.exe --install -d Ubuntu`

    Other Linux distributions (other than Ubuntu) can be chosen here.

5. In the Ubuntu window that opens, enter a username and password.

### Docker Desktop
[Docker Desktop](https://docs.docker.com/desktop/) is the desktop app for Docker and makes it easy to run containers.

1. Install Docker Desktop for Windows from [here](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe). Keep the default settings for installation.
2. Open the "Docker Desktop" app to start the Docker engine.

### X Window System (X11)
X11 allows the Docker container to display the graphical interfaces for its apps on your current desktop.

1. Install [VcXsrv](https://sourceforge.net/projects/vcxsrv/) from [here](https://sourceforge.net/projects/vcxsrv/files/latest/download). Keep the default settings for installation.
2. Open the "XLaunch" app.
3. Click “Next” through all the pages, keeping the default settings EXCEPT check the “Disable Access Control” option. Before clicking “Finish”, click “Save Configuration”. Navigate to 

    `C:\Users\[your_username]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
   
    then click “Save”. (The `AppData` folder may be hidden.) This allows XLaunch to automatically run with your chosen settings when you start your computer.

### This Repo

1. Open the Command Prompt.
2. Run `git config --global core.autocrlf input` to [configure Git to ensure line endings in files you clone are correct for Linux](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings?platform=linux). 
3. Change the working directory to where you want to place the repo, and run `git clone [URL of this repo]` to clone this repo.
4. Change the working directory to the newly created repo, and run `git submodule update --init --recursive --remote` to clone the IIC-OSIC-TOOLS and laygo2_workspace_sky130 submodules.
5. Change the working directory to the repo's `Setup Scripts` folder.
6. Run `.\setup_windows_iic.bat` to create the Docker container and run it. 
    - If needed, edit the `DOCKER_TAG` variable inside the script to point to another version. `2023.06` is the latest version that we found works with LAYGO2 (Last Updated: 11/14/23).
    - If you have never downloaded the IIC-OSIC-TOOLS Docker image or the selected version of it before, this step might take a while. 
    - To re-run a Docker container that was closed, open the "Docker Desktop" app and click on the play button next to the container you created.
7. Run `.\setup_windows_laygo2.bat` to set up laygo2_workspace_sky130 to work with IIC-OSIC-TOOLS.

## How to Use
This setup should work mostly the same as the [IIC-OSIC-TOOLS](https://github.com/iic-jku/IIC-OSIC-TOOLS) and [laygo2_workspace_sky130](https://github.com/niftylab/laygo2_workspace_sky130) repos; Refer to their documentations for more information. The only differences are the following:

1. When working inside the Docker container, its directory `/foss/designs` will be linked to the directory of this repo on your computer rather than the default `%USERPROFILE%\eda\designs` used by IIC-OSIC-TOOLS.
    - e.g. `/foss/designs` will show files in `C:\Users\[your_username]\Documents\Github\custom_OSIC-TOOLS`
2. When running the Python code for LAYGO2, use the new `compile_tch.sh` script that was added to the `laygo_workspace_sky130` folder, like so:

    `./compile_tcl.sh laygo2_example/logic/inv.py`

    This script helps set up the correct Python path (vs. just using `ipython` then `run laygo2_example/logic/inv.py`).
