@echo off
color 2

::set Name=""

:start
echo -----------------------------------------
echo Select name of the PC
echo [1] - Java
echo [2] - Unity
echo [3] - Python
echo -----------------------------------------

choice /c 123 /m "Take your choice "
if %errorlevel% == 1 set Name=Java-
if %errorlevel% == 2 set Name=Unity-
if %errorlevel% == 3 set Name=Python-

echo -----------------------------------------

echo Select number of PC [1:12] or Maseter
set /p Number=%Name%


echo -----------------------------------------

echo Name is : "%Name%%Number%"

choice /c yn /m "Are you sure [Y/N]?  "
if %errorlevel% == 1 goto changePcName
if %errorlevel% == 2 goto start


:changePcName
echo -----------------------------------------
set  testName=asd
wmic computersystem where name="%computername%" call rename name="%Name%%Number%"
echo OK
goto setPolices



:setPolices
echo -----------------------------------------
choice /c yn /m "Update polices [Y/N]?  "
if %errorlevel% == 1 echo -----------------------------------------
if %errorlevel% == 2 goto :eof

echo Updating polices...
start C:\PROGS\StudentPC_config\UpdatePolicesFromGit.bat
timeout 5
echo Polices updated successfully

pause
goto :eof


:changeBG


echo -----------------------------------------
choice /c yn /m "Update Backgroung [Y/N]?  "
if %errorlevel% == 1 echo -----------------------------------------
if %errorlevel% == 2 goto end

set BGpath=C:\PROGS\StudentPC_config\BG\%Name:-=%\%number%.png
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "Wallpaper" /t REG_SZ /d "%BGpath%" /f
echo Background updated successfully
pause



:end
echo Your PC ready to work
echo You need to reboot your pc
choice /c yn /m "RESTART NOW [Y/N]?  "
if %errorlevel% == 1 goto shutdown /r /t 10 /c PC REBOOT IN 10 SECONDS
if %errorlevel% == 2 echo Ok, remember to reboot your pc manually
pause
goto :eof



