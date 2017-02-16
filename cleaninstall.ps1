#env var
SET _localNugetPath="C:\LocalNuGet"

cinst powershell -y
cinst curl -y
refreshenv

#------------------------- NODE JS --------------------------------
#NODEjs + NPM
cinst nodejs -y
refreshenv

#install gulp-cli as a global command
npm install -g gulp-cli

#install yarn as an alternative package manager
cinst yarn -y
cinst electron -y
cinst yeoman -y     #installs ruby 2.3.1 and compass
refreshenv

#------------------------- GIT utilities -------------------------

# install GIT
cinst git.install  -y
refreshenv

cinst git-lfs.install -y
git lfs install

#install ungit
npm install -g ungit

#------------------------- NUGET ----------------------------------
cinst nuget.commandline -y
cinst nugetpackageexplorer -y

# add local dev feed
setx -m LOCALNUGET %_localNugetPath%    # add at machine level
nuget sources Add -Name "Local Nuget" -Source %_localNugetPath%


# ------------------------ VS extensions --------------------------
# FOR latest vs2015
#cinst npmtaskrunner -y --allow-empty-checksums
curl -O https://visualstudiogallery.msdn.microsoft.com/c9f7667c-ac1f-4be8-82c6-9a4e34fef47b/file/230744/1/YarnTaskRunner.vsix -k
YarnTaskRunner.vsix

# ------------------------ TOOLS ----------------------------------
cinst visualstudiocode -y
# code extensions
code --install-extension vscode-icons
code --install-extension ms-vscode.csharp
code --install-extension dbaeumer.vscode-eslint
code --install-extension Ionide.Ionide-FAKE
code --install-extension Ionide.Ionide-fsharp
code --install-extension Ionide.Ionide-Paket
code --install-extension dbaeumer.jshint
code --install-extension ms-vscode.PowerShell
code --install-extension PeterJausovec.vscode-docker
code --install-extension msjsdiag.debugger-for-chrome


cinst notepadplusplus.install -y
git config --global core.editor \
    "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

cinst conemu -y
cinst 7zip.install -y
cinst fiddler4 -y


#windows tools
cinst procexp -y
cinst procmon -y

#web tools
cinst docker -y

#-------------------------- comunication
cinst slack -y

# ------------------------ Project templating ---------------------


# ------------------------ ENV VARS -------------------------------
# ENV VARS 

echo "done"