# Scripts
Configuration file `settings.json` is used in all scripts and must be initialized with the container specific settings, for the current project. Build configuration file `build.json` contains the neccessary settings to perform the build process.

## Initialize.ps1
Initializes the needed environment: reads the `settings.json` file.

## Create-Container.ps1
Creates the local container for the project, specific settings like license file ecc. must set up in the `settings.json` file.

## Install-Smeagol.ps1
Installs Smeagol NVT remote service inside a container.

## App-Install.ps1
Installs an App inside a container, you must specify the container name and the name of the app (folder name) as parameter.

## App-Uninstall.ps1
Uninstalls an App inside a container, you must specify the container name and the name of the app (folder name) as parameter.
