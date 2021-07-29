@echo off
::
:: Build script for "<Paper Samurai>"
::
:: Copyright (C)2021 Gabriel Zamora, All rights reserved

set ERRFILE=Logs\errorLogs.txt
set LOGFILE=Logs\logs.txt
ECHO %LOGFILE%

set PROJECT="GD62-PG20-ATeam-Unity" >> %LOGFILE%
ECHO %PROJECT%

:: SRC Folder, a folder to use for a clean build,
:: note you will wipe this out and re-clone it every build.
set SRC=%PROJECT% >> %LOGFILE%
ECHO Logfile set

:: DEST Folder is where the final build goes, after all things not required
:: are stripped away.
:: This folder is clean, can be zipped, archived or uploaded
set DEST=Release
ECHO dest set

:: old builds
set RELEASE=Builds
ECHO release set

:: Edit these paths to where they exist on your build computer
:: These are the paths for our VFS machines
set UNITY="%PROGRAMFILES%\Unity\Hub\Editor\2021.1.7f1\Editor\Unity.exe"
::set UNREAL="C:/Program Files/Epic Games/UE_4.26/Engine"
::set UCC="%UNREAL%/Binaries/DotNET/UnrealBuildTool.exe"
::set UNREAL_PRE="%UNREAL%/Build/BatchFiles/RunUAT"

:: GIT:  Uncomment the lines below if using Git Source Control
:: Github Repository
set GIT_REPO="https://github.com/vfs-sct/GD62-PG20-ATeam-Unity.git"
:: go get a fresh copy of your repo - Develop branch
git clone --branch develop %GIT_REPO%

ECHO cloned

:: Build the code with UNREAL, uncomment the lines below
:: %UCC% %PROJECT% -ModuleWithSuffix %PROJECT% 5202 Win64 Development -editorrecompile -canskiplink %SRC%\%PROJECT%.uproject
:: %UNREAL_PRE% BuildCookRun -project=%SRC%\%PROJECT%.uproject -noP4 -platform=Win64 -clientconfig=Shipping -serverconfig=Shipping -cook -allmaps -build -stage -pak -archive -archivedirectory=%DEST%

:: Build the code with Unity, comment out the unreal build and uncomment this

%UNITY% -quit -batchmode -projectPath %PROJECT% -buildTarget Win64 -buildWindows64Player Build\Build.exe -logFile %LOGFILE%

:: Filter Exceptions to errorLog.txt
findstr "Exception" %LOGFILE% >> %ERRFILE%
@echo "Build complete"


:: Generate the release
xcopy "GD62-PG20-ATeam-Unity"\Build %DEST% /E /Y

:: Clean oldest folder and push the previews builds
rmdir /S /Q %RELEASE%\oldest
ren %RELEASE%\yesterday oldest
ren %RELEASE%\today yesterday
mkdir %RELEASE%\today

:: Migrate the build to the release folder
xcopy %DEST% %RELEASE%\today /E /Y



















goto end
:usage
::
:: build_it <perforce_passwd>

:end
:: Unset all the temp env variables we used
set PROJECT=
set SRC=
set DEST=
set COHORT=
set RELEASE=
set ENGINE=
set UCC=
set UBUILD=
set UNITY=