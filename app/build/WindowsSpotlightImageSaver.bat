@echo off
color 0F
echo [Version 1.2.0]
echo Welcome to Windows Spotlight Image Saver
echo.
echo Enter '0' to Exit
echo Enter '1' to Get Output Directory Path from History
echo Enter '2' to Enter a New Output Directory Path
set /p CHOICE= Choose One From The Above: 
if /i %CHOICE%==1 (goto FromHistory)
if /i %CHOICE%==2 (goto SetNewOutput)
echo.

:FromHistory
echo.
if exist OutputPathHistory.txt (
for /f "Delims=" %%a in (OutputPathHistory.txt) do (set OUTPUTPATH=%%a)
color 0A
echo Output Path Found..
goto decide
) else (
color 0C
echo No History Found!!
pause
goto SetNewOutput
)
echo.

:SetNewOutput
color 0B
echo.
echo Enter New Output Path:
set /p OUTPUTPATH=
echo %OUTPUTPATH% > OutputPathHistory.txt
goto process

:decide
color 0E
echo %OUTPUTPATH%
echo Do You Want To Use The Following Directory As Output?
echo Enter '1' for YES
echo Enter '0' for NO
set /p DECIDE_HISTORY= 
if /i %DECIDE_HISTORY%==1 (goto process)
if /i %DECIDE_HISTORY%==0 (goto SetNewOutput)
echo.

:process
color 0A
echo.
echo Starting..
echo.
echo Getting Images..
echo.
cd/
C:
cd %localappdata%
cd Packages
cd Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy
cd LocalState
cd Assets
xcopy * "%OUTPUTPATH%"
echo.
echo.
echo Imported
echo.
echo Renaming Files..
cd/
pushd %OUTPUTPATH%
ren *.* *.jpg
echo.
echo Done
echo.
pause