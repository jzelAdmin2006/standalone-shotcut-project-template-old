@echo off

if exist ".\_ShotcutPortable\extracted.flag" (
    echo Opening the standalone Shotcut project...
) else (
    echo Opening the standalone Shotcut project for the first time ^(subsequent openings will be faster^)...

	"_ShotcutPortable\7zr.exe" x ".\_ShotcutPortable\_ShotcutPortable.7z.001" -o".\_ShotcutPortable" -aoa >nul 2>&1
	
	if not errorlevel 1 (
		echo > ".\_ShotcutPortable\extracted.flag"
	)
)
if errorlevel 1 goto fail
start "" "_ShotcutPortable\shotcut.exe" "src\Project.mlt"
if errorlevel 1 (
	goto fail
) else (
    del ".\_ShotcutPortable\_ShotcutPortable.7z*" >nul 2>&1
    del ".\_ShotcutPortable\7zr.exe" >nul 2>&1
	goto end
)

:fail
    color 0C
	echo.
    echo An error occurred. Please ensure your standalone Shotcut project is fully present and no other processes are trying to access it.
    pause

:end
