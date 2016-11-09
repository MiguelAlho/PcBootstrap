# PcBootstrap
Bootstrap script for my pc

This repo supplies scripts to setup / update the development environment with necessary tools for developing with little hassle.

![66722184.jpg](https://bitbucket.org/repo/RGpjyz/images/2154315572-66722184.jpg)

## Using the Bootstrap Script

This is currently a multi-step process (unfortunatley).

### 1- Install Chocolatey

Open a command line shell as **Administrator** and run the following command:

```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
```

This will install the latest version of Chocolatey, which is required for the following steps. The installation changes environment variables and these sometimes are not loaded again without restarting the shell.

### 2 - Install Applications and Tools

Download the following script and and save it somewhere as `cleaninstall.ps1`.

``` 
insert git url here
```

Open a **new command line shell as Administrator** and navigate to the folder where you saved the command file. Run it by typing:

```
> powershell ./cleaninstall.ps1
```

Alternatively you can clone this repo and run the command from there (but you will need GIT already installed). 

### 3 - Validate Your Installation

Check that the follow environment values have been added to the system:

| Key | Value |
| --- | ----- |
| LOCALNUGET | C:\LocalNuGet |

If any of these keys are missing, add them in the Enviroment Variables GUI or, in a command line, run:

```
setx -m LOCALNUGET C:\LocalNuGet
```

Unfortunately, `setx`, within the `.cmd` script may fail, and end up not setting the variables. This can still be done manually aterwards.

Because environment variables have been changed, you will need to close any apps that use these (including command shells and visual studio). In some cases (because system vars are changed), you may need to restart the OS.

### 4 - Validate Visual Studio tools installation

Open Visual Studio 2015 and check that the extensions mentioned in the "What's in it?" section have been included. Also, perform the steps mentioned in "Visual Studio External Tools", below, to make sure VS points to the most recent NodeJs installation that includes ES6 support.

## What's in it?

The script performs the following steps:

| Action    | Program | Optional | Notes| URL |
| -------   | ------- | ---- | --- | --- |
| Install   | *Chocolatey* | | will allow the installation of other applications | [Cholocatey Home](https://chocolatey.org/)  | 
| Install   | *Powershell* | | get most recent version (5+) |  |
| Install   | *cUrl* | | make http requests from the command line | [cUrl Home](https://curl.haxx.se/)  |
| Install   | *NodeJs* | | 6+ ; include NPM | [NodeJs home](https://nodejs.org/en/) |
| Install   | *Gulp-Cli* | | Js-based task manager - make it available in the command line (global dependency) |  |
| Install   | *Yarn* | | Facebook's NPM-compatible package manager - make it available in the command line (global dependency) | [Yarn site](https://yarnpkg.com/) |
| Install   | *electron* | | js desktop app dev platform | [electron site](https://electron.io/) |
| Install   | *Yeoman* | | project templating engine | [site](http://yeoman.io/) |
| Install   | *Git* | | for source control | [git home](https://git-scm.com/)  |
| Install   | *Git LFS* | | Large File Support for Git | [bitbucket GIT sLFS](https://confluence.atlassian.com/bitbucket/use-git-lfs-with-bitbucket-828781636.html) |
| Install   | *UnGit* | yes | git repo browser and ui | [ungit @ github](https://github.com/FredrikNoren/ungit)  |
| Install   | *Nuget* | | install and register in the command line for easy access | [Nuget.org](https://www.nuget.org/) |
| Install   | *Nuget Package Explorer* | | view nuget package contents | [Nuget Package Explorer github page](https://github.com/NuGetPackageExplorer/NuGetPackageExplorer) |
| Configure | *LOCALNUGET* env key | | Set the env var to a default location (Optional : c:\LocalNuget) |   |
| Install   | *Yarn task runner* | | Visual Studio support for Npm Tasks | [code](https://github.com/MiguelAlho/YarnTaskRunner) |
| Install   | *Command task runner* | | Visual Studio support for running cmd files in Task explorer | |
| Install   | *Visual Studio Code* | yes | Useful for editing some files in projects | [Visual Studio Home](https://www.visualstudio.com/)  |
| Install   | *Notepad++* | yes | Useful for editing some files in projects | [Notepad++ home](https://notepad-plus-plus.org/) |
| Install   | *Notepad++ as Git Editor* | yes | Useful for editing git messages instead of Vim :) |  |
| Install   | *ConEmu* | yes | multi-shell app | [ConEmu](https://conemu.github.io/)  |
| Install   | *7-zip* | | zip file visualizer | [7-Zip Home](http://www.7-zip.org/)  |
| Install   | *Fiddler 4* | | web request tracer | [Fiddler Home](http://www.telerik.com/fiddler))  |
| Install   | *Process Explorer* | | dll and handle explorer. usefull for unlocking files | [app site](https://technet.microsoft.com/en-us/sysinternals/bb896653.aspx) |
| Install   | *Process Monitor* | | process / thread monitor | [app site](http://technet.microsoft.com/en-us/sysinternals/bb896645.aspx) |
| Install   | *slack* | | comunication tool | [app site](https://slack.com/) |


## Other Useful manual configurations

### Visual Studio External Tools:
Another important step is to update paths for external tools, so that Visual studio can pick up system tools instead of it's own copies, especially of Node. In order to do so,
1. Open VS 2015, 
1. In the QuickLaunch toolbar (Ctrl+Q or in the upper right corner of the window) type in "external web tools" and hit enter
1. Disable paths with "external" in it
1. Move "$(PATH)" to the second position

You should end up with the following list:

![externalToolSettings.png](https://bitbucket.org/repo/RGpjyz/images/1033115403-externalToolSettings.png)

## Known Issues

- Environment Vars may not be set, and / or  you may need to restart Windows to load them
- SetX commands within the script may fail.

## Things to add in the future:

- **Beyond Compare** - no package exists in chocolatey to install BC 3.3.13; Needs manual installation. Once this is done, you can set Git to use BC as a merge tool by running:

```
git config --global diff.tool bc3
git config --global difftool.bc3.path "C:\Program files (x86)\Beyond Compare 3\bcomp.exe"
git config --global difftool.prompt false
git config --global merge.tool bc3
git config --global mergetool.bc3.path "C:\Program files (x86)\Beyond Compare 3\bcomp.exe"
git config --global mergetool.keepbackup false
```

- **LocalHistory** support - allows you save changes to files in VS (avoid loss of code in git ops). Chocolatey can't yet install the vsix package correctly, but can be done manually by downloading the installer at:

```
https://localhistory.codeplex.com/
```
Codeplex's multiple redirects when clicking "download" make automating this challenging.