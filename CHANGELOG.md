# Changelog
All notable changes to this project will be documented in this file.

## Unreleased
Write all upcoming changes here.

## 1.0.7 (2021-10-13)
### Changed
- manifest updated for BC19
- documentation updated for BC19

## 1.0.6 (2021-09-17)
### Added
- script to copy all the .net assemblies inside the local container

## 1.0.5 (2021-07-22)
### Added
- folder package provider for all Apps not published or provided by LABs 

## 1.0.4 (2021-05-21)
### Added
- file `CONFIG.md` added, and has the content of the old `README.md` file

### Changed
- content of the `README.md` file changed, should contain the description of the customer solution

## 1.0.3 (2021-05-12)
### Changed
- parameter names changed on scripts `App-Install.ps1` and `App-Uninstall.ps1`
- script `App-Install.ps1` checks for an existing App and calls the data upgrade command instead of the install command
- documentation changed

## 1.0.2 (2021-02-19)
### Changed
- only one template for all versions of Business Central, the template is always configured for the last version of AL, the developer must change the `app.json` file to use a specific platform and application version
- the properties `appFolders` and `testFolders` are no more needed to initialize in the `build.json` file, if not specified then the build process collects the folders automatically

## 1.0.1 (2021-01-19)
### Changed
- the settings (`settings.json`) for each App are now moved to the workspace settings, only for test Apps the settings should configured per App
- the `build.json` file was moved from the `script` folder to the `config` folder
- the application rulesets are now managed per workspace only once, and no any more per App, you can find the ruleset `AppRuleSet.json` file inside the `config` folder

### Removed
- the `AppRuleSet.json` file was removed from the App folder
- the `Settings.json` file was removed from the App `.vscode` folder
