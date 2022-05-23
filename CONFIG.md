# Dynamics 365 Business Central - Customer Project
Use this repository as a starting point for your AL development in Visual Studio Code. All the code is in one Git repository hosted by Azure DevOps, a so-called monorepo (short for monolithic repository). Code is broken up into modules/apps, which each live in their own root-level folder.

Visual Studio Code offers the multi-root workspace feature, which enables grouping different project folders into one workspace. The AL language extension also supports the multi-root functionality and allows you to work with multiple AL folders including roots and projects within one workspace.

In the root folder of the repository you find the `.code-workspace` file, and you should always open your project by the workspace instead per folder. On initialization of your project, rename the workspace file with the name of your project, i.e project ZZZ should have `zzz.code-workspace` as workspace file.

At the start, the repositoriy consists of two base folders: `app` and `test`. The `app` folder is a template to create new Apps, if you need another App then create a new root-level folder by copying the `app` folder, and set up the `app.json` file, with the related settings like `id`, `name` and `dependencies`. Add the newly created folder to your projects workspace.

    +
    |
    +-- app +
    |       |
    |       +-- src
    |
    +-- test
    |
    +-- config
    +-- scripts

A well structured application consist of one `base` or `core` App, that should contain the **Common Data Layer** with small business logic, and several Apps that reference the `base`/`core` App. The **Common Data Layer** contains the most tables and table extensions of your application, that can be referenced across all your Apps.

                      +-------+-------+-------+
                      | App1  | App2  | AppN  |
                      +-------+-------+-------+
                      |         Base          |
                      +-----------------------+

> **Note:** 
> for large solutions is a best practice to divide the **Common Data Layer** into separate Apps per `table` and `tableextension`.

# Getting Started
1.	Installation
2.	Settings
3.  Development
4.  Build and Test


## 1. Installation
### 1.1. Git
Verify that Git is installed on your local machine, otherwise download and install [Git](https://git-scm.com/download/win) for Windows. Before you can use Git within Azure DevOps, you must do some basic configurations. 

Set up your name and e-mail

``` powershell
git config --global user.name "John Doe"
git config --global user.email "john.doe@eos-solutions.it"
```

### 1.2. Docker
Install Docker to test your application in a sandbox environment. Docker only runs on Windows 10 or Windows Server 2016 (or later).

* [prepare Windows 10 for containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-10-Client)
* [prepare Windows Server for containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server)

> **Note:**
> all PowerShell cmdlt must be run with administrator users rights.

Install the `BcContainerHelper` module from PowerShell, it supports you on managing containers with Business Central.

``` powershell
Install-Module BcContainerHelper -force
```

The `BcContainerHelper` module works with artifacts, you must specify an artifact URL instead of the image name. If you specify the `imageName` parameter, then the cmdlt creates a local image with this name.

``` powershell
$artifactUrl = Get-BcArtifactUrl -storageAccount bcartifacts -type OnPrem -country it -version 19 -select Latest
New-BcContainer `
    -accept_eula `
    -containerName bc19it `
    -artifactUrl $artifactUrl `
    -auth NavUserPassword `
    -updateHosts
```

When you create the container, you can specify the `-includeTestToolkit` switch to install the test toolkit, but you can also do it in later moment by running following cmdlt.

``` powershell
Import-TestToolkitToBcContainer -containerName bc19it
```

> **Note:**
>  you can use the Powershell script `Create-Container.ps1` inside the `scripts` folder, to create your local container in an easy way.

## 1.3. AL Language
Install the **AL Language** extension from Visual Studio Code Marketplace, if the required version is not yet available on Marketplace, then download the corresponding VSIX file from your container. When the container is created then it shows to you where you can find the VSIX file. If you have forgotten, look into your container logs, that will show it.
``` powershell
docker logs containerName
```

Copy from the `config` folder one of the `vscode.*` folders (`vscode.app` for an App and `vscode.test` for a test unit) into your app folder and rename it to `.vscode`. Do the copy and rename action inside Visual Studio Code.


## 2. Settings
Modify the `launch.json` file under `.vscode` folder and set up the connection properties for your tenant inside the container, f.e. for a local container sandbox. Replace `containerName` with the name of your local container.
``` JSON
  "name": "Your own server",
  "server": "http://containerName",
  "serverInstance": "BC",
```

Modify the `app.json` file under your App root folder, and give the App an `id` and a `name`. A valid `id` can be created with the **Create GUI** extension from the Visual Studio Code Marketplace. Replace all `version` properties with the right version of your solution, f.e. `"19.0.0.0"`. Set the `runtime` property with the right value of the platform that you are using. Next you can find valid `runtime` values.
``` powershell
  "runtime": "1.0"  # NAV2018
  "runtime": "2.0"  # BC13
  "runtime": "3.0"  # BC14
  "runtime": "4.0"  # BC15
  "runtime": "5.0"  # BC16
  "runtime": "6.0"  # BC17
  "runtime": "7.0"  # BC18
  "runtime": "8.0"  # BC19
```

**Example - snippet of `app.json` file**
``` JSON
  "id": "00000000-0000-0000-0000-000000000001",
  "name": "name of the App",
  "publisher": "EOS Solutions",
  "version": "19.0.0.0",
```

> **Note:**
> as a best practice for version numbering, is to use only the `<major>` and `<minor>` numbers, and set the `<build>` and `<revision>` numbers always to `0`, f.e. `19.0.0.0`. This rule is also valid for version numbering in dependencies. In this way you must don't think about what is the last valid version, the system solves this for you.

When you have set up all the requested settings, you can download the symbols with the AL command `AL: Download symbols`. If everything works then you find a `.alpackages` folder under your root folder of the workspace, within all symbols of the application. The `.alpackages` is a shared folder for all your Apps of the current repository.

### 2.1. Microsoft .NET Interoperability from AL
You can call .NET type members, including methods, properties, and constructors, from AL code. This is a two-step process: first you must declare the type in a **dotnet** package, and then reference it from code using the **DotNet** type. You can reference any compatible assembly by providing the compiler with a path to the assemblies containing folder, specify the `al.assemblyProbingPaths` setting on your workspace settings.

**Example - workspace settings**
``` JSON
  "al.assemblyProbingPaths": [
      "../.netpackages",
      "C:/Windows/assembly/"
  ]
```

Use the `Copy-AssembliesInContainer.ps1` script to copy all the assemblies found inside the `.netpackages` folder into the local container.

> **Note:**
> .NET Interoperability is only available on-premise. If you want to use this functionality, you must set the `"target": "OnPrem"` in the `app.json` file.

### 2.2. Third Party Apps
If you need to use **Third Party Apps** (not provided by **LABs**), you can include the related `*.app` files into the repositroy. Put the `*.app` files in the folder `config\feed`, this allows you to synchronize the `*.app` files with the repository, otherwise the `*.app` files are ignored by **Git**.

Add the related **Folder Package Provider** to the `config\build.json` file, in this way the build process finds the related Apps to deploy as dependencies.
``` JSON
    "packageProvider": "upack/BC19,folder/config/feed",
```

## 3. Development
Start your development by creating a feature branch from the `master` branch, branch policies prohibit direct development on the `master` branch. Creating feature branches for all your changes makes reviewing history simple, always one developer should work on a feature branch. Integrate your modifications by Pull Requests.

Use the following rules for naming your feature branches:
* **feature**: users/username/TDAG1234 
* **bugfix**: bugfix/TDAG1234
* **hotfix**: hotfix/TDAG1234

For the username use the initial of the first name and the whole last name, f.e. user John Doe should create following feature branch `users/jdoe/TDAG1234`.

Create a feature branch with the following command `git checkout -b users/jdoe/TDAG1234`.

Write your commit message in the following way:
* **feature**: [FEATURE] message
* **bugfix**: [BUGFIX] message
* **hotfix**: [HOTFIX] message

If a feature is completed then write f.e. following commit message `[FEATURE] completed`.

Push changes only if the build succeeds!

After completion of the feature branch, delete them if it is no more needed: `git branch -d users/jdoe/TDAG1234`. The remote branch is not deleted, and must be deleted remotely if you don't need it any more.

Use following naming guidelines for AL files: `Prefix+ObjectName.ObjectType.al`, the `Prefix` is defined inside the `AppSourceCop.json` file and therefore checked by the code analyzer. The `ObjectType` is one of the following types: `Table`, `TableExt`, `Page`, `PageExt`, `Report`, `Codeunit`, `XmlPort`, `Query`, `Enum`, `EnumExt`, `Interface`. One AL file should always contain exactly one object.


## 4. Build and Test
Build and test your App inside the container sandbox. Use the base folder `test` to write your test units, and set up the configurations (`settings.json`, `launch.json` and `app.json`) in the same way as for your App.

Appropriate code analyzers are set to contextual rules and applied to AL extension development. These rules can generate an error or a warning, when the code guidelines are not observed.

Set up the build pipeline by using the `azure-pipelines.yml` file on your root workspace folder. All the needed settings for your build, you can define inside the `config\build.json` file, like user name and passwords for the build container. The two properties `"appFolders"` and `"testFolders"` can contain a list of app folders, that should be builded. The names of the App folders must be organized in a comma (,) separated list. If you left them empty, then the build process composes the `"appFolders"` and `"testFolders"` lists automatically when the build pipeline runs.

Depending on which version you use, you must set the `"packageProvider"` property, this should correspond to the platform version you are using, f.e. if your platfrom version is 17, then you should use the `"upack/BC17"` package provider. You can use more than one package provider, by separating them with commas.

If you are using **Third Party Apps**, then provide the related `*.app` files within the repository, and set the `"packageProvider"` accordingly, f.i. `"folder/config/feed"`, where `folder/` is a reserved word and indicates to use a **Folder Package Provider** instead of an **UPack Package Provider** (see [2.2. Third Party Apps](#22-third-party-apps)).

If the build process finds the directory named `.netpackages` on your root-folder of the workspace, then its content is copied to the build container for compilation.
