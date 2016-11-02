::env var
SET _localNugetPath="C:\LocalNuGet"

::install chocolatey from the web
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

:: add gui 
choco install chocolateygui -y

:: use chocolatey to install latest powershell (5.0)
choco install powershell -y

::------------------------- NODE JS --------------------------------
::NODEjs + NPM
choco install nodejs -y

::install gulp-cli as a global command
call npm install -g gulp-cli

::install yarn as an alternative package manager
call npm install -g yarn

::------------------------- GIT utilities -------------------------

:: install GIT
choco install git -y
choco install git-lfs.install -y
call git lfs install

::install ungit
call npm install -g ungit

::------------------------- NUGET ----------------------------------
choco install nuget.commandline -y
choco install nugetpackageexplorer -y

:: add local dev feed
setx -m LOCALNUGET %_localNugetPath%    :: add at machine level
nuget sources Add -Name "Local Nuget" -Source %_localNugetPath%


:: ------------------------ VS extensions --------------------------
:: FOR latest vs2015
::choco install npmtaskrunner -y --allow-empty-checksums
curl -O https://visualstudiogallery.msdn.microsoft.com/c9f7667c-ac1f-4be8-82c6-9a4e34fef47b/file/230744/1/YarnTaskRunner.vsix -k
YarnTaskRunner.vsix

choco install commandtaskrunner -y --allow-empty-checksums

:: ------------------------ TOOLS ----------------------------------
choco install visualstudiocode -y
:: code extensions
code --install-extension vscode-icons
code --install-extension ms-vscode.csharp
code --install-extension dbaeumer.vscode-eslint
code --install-extension Ionide.Ionide-FAKE
code --install-extension Ionide.Ionide-fsharp
code --install-extension Ionide.Ionide-Paket
code --install-extension dbaeumer.jshint
code --install-extension ms-vscode.PowerShell


choco install notepadplusplus.install -y
git config --global core.editor \
    "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

choco install conemu -y´

choco install 7zip.install -y
choco install curl -y

::windows tools
choco install procexp -y
choco install procmon -y

:: ------------------------ Project templating ---------------------
call npm install -g yo


:: ------------------------ ENV VARS -------------------------------
:: ENV VARS 

echo "done"