@echo off
color 0F
echo  Windows Spotlight Image Saver
echo  Version 1.3.0
echo  Download/Update: https://wsis.pages.dev
echo ----------------------------------------------
echo.
echo.
echo  Enter '0' to Exit
echo  Enter '1' to Get Output Directory Path from History
echo  Enter '2' to Enter a New Output Directory Path
set /p CHOICE= Choose One From The Above: 
if /i %CHOICE%==1 (goto FromHistory)
if /i %CHOICE%==2 (goto SetNewOutput)
echo.

:FromHistory
echo.
if exist OutputPathHistory.txt (
for /f "Delims=" %%a in (OutputPathHistory.txt) do (set OUTPUTPATH=%%a)
color 0A
echo.
echo.
echo Output Path Found: 
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
echo.
echo  Do You Want To Use The Above Directory As Output?
echo  Enter '1' for YES
echo  Enter '0' for NO
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
cd/
pushd %OUTPUTPATH%
echo.
goto delete

:delete
del 0b426d2ed0dfa40b7c7c747cc7779b1a09fde88e69eeb8fc36887239874cca8d
del 9c56fbe6911e0cc3dd9ee7c5db9aceae4d89fc0a024d1853aef99bfe34841b74
del 8fff2e00784be5022531e2bbbec7d142eb4d6a04bcfac67284d69a4e5f160a9f
del 5c8a2166dbfbd8903e112bb8b56e80318bbce952fdbcfb408c4121bc73b813a5
del 2e2695a085e8e1333cf0c6577d784d631b0a0a4718813b957d58b384174dd19a
del 1e29434802ce1e4aaa7ca8e8d09830cdd3386a82de207c017fe769b3fc334422
del 9cad8260b6aa06f4325b44dbe3a5898390289a1ddd03635a9749494d5a91fcd6
del 9e096fd22b60329e9617446fcba86684041519e342a53afe566cf707244dd750
del 16ea5037abdd0a917fc4c833ba99e9886f8cef06b335435ec31c1f309440c4e7
del 037c36f003651fb9c10e544af926af8dd51fa017892c82b2d8c8f3a6ab154a25
del 48b70f2a6dbc538d46382e1408768f438647af274489dac9c4d9d60e048a76b1
del 93aef802584855accbd164af76d2ec709425a8ff6d9c14b32bb4602916bb90fc
del 248f9dd3294a38b87f56fd334b5bb9cfaf485e798942d1a2ebbf1bcc47c31454
del 1247a657fb7ca61cda4214de9c943daaebada7b739fe43a43074c015ba0b4455
del 5816e7e7c10ba1a3d5953330c0de911ce4adfd978f202da65a04dc4b2e880423
del 66328e42077d7df12b25c4e7eb60faa0cc6743afe3f044ee5c7bb6709cbf5b2e
del 82034fce4c0cc2c715e07bd60ec5799e40a9f510e49bec0181cae522d73a585c
del 483204ee83c47b98c9dc14028a08d447208e898c22de8102e0d5a2f4019690fb
del a3df3c6e117ce742bdc04f12fca107bfa132234a19693292047aff0caf4a4623
del b7ad662c8eece40bedf5d527b3481c3a43df659de9699fbd1b687e15eb4df0fc
del c5f3856bac35a309431b001eee50daa425caad961d572f73058169f5a60e2804
del d82c372e3b63a4d3dded87e4dc88d80ff82a64c009a7d447898b797180708bac
del e2a606189e4beba9d26675333b4653c1ffc8b5cf20d2cd8022d20e3a1f0d2676
del f37b834b36a7a54bc276fb39ab0572f152504756f72db4b1b1e75f2cd1e9ca7c
del ff2a6839090e2655d227919e453fab8d338997d2981012e5cdf256c84fb626ce
del 7e4d5305e5ab9a8a28637b762286107db67d4a13d62ed2d149cce74d82cb025b
goto rename

:rename
echo Renaming Files..
echo.
ren *.* *.jpg
echo.
echo Done
echo.
pause