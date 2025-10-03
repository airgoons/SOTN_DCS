@echo off
setlocal enabledelayedexpansion

:: Define source folder
set "source_dir=%~dp0SOTN_template"

:: Check if source folder exists
if not exist "%source_dir%" (
    echo Source folder not found: %source_dir%
    pause
    exit /b
)

:: Create timestamped output filename
set "datetime=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "zipname=sotn_%datetime%.zip"
set "mizname=sotn_%datetime%.miz"

:: Zip contents of SOTN_template (not the folder itself)
powershell -nologo -noprofile -command ^
    "$items = Get-ChildItem -Path '%source_dir%' -Force; Compress-Archive -Path $items.FullName -DestinationPath '%~dp0%zipname%' -Force"

:: Rename .zip to .miz
rename "%~dp0%zipname%" "%mizname%"

echo Created: %mizname%
pause
