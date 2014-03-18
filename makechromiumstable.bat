@echo off
echo Attention before run this script install depot tools
echo Attention before run this script install visual studio 2013
echo Attention before run this script Windows SDK for Windows 8
echo Attention before run this script install windows git-scm
echo Attention delete ..\sourcecode directory if its already exists
echo =========================================================================
echo ======== Setting Up Script... current time - %TIME%"
echo =========================================================================
set mingwsh="C:\Program Files (x86)\Git\bin\sh.exe"
set scriptfolder=%cd%
if not exist %scriptfolder%\..\sourcecode mkdir %scriptfolder%\..\sourcecode
set chromepath=%scriptfolder%\..\sourcecode
set buildchromiumscript=%scriptfolder%\subscripts\buildchromium.bat
set getchromiumscript=%scriptfolder%\subscripts\getchromium.bat
set logfile=%scriptfolder%\log.log
set gituser=porky
set gitemail=porky@gmail.com
set shlogfile=./log.log
set shchromepath=./../sourcecode
set shstablebranchscript=./subscripts/stablebranchscript.sh
echo Your settings are:
echo Path for Chromium Windows Build script:
echo %scriptfolder%
echo Chromium sources path:
echo %chromepath%
echo Git scm path:
echo %mingwsh%
echo Chromium build script path:
echo %buildchromiumscript%
echo Log file path:
echo %logfile%
echo Git user:
echo %gituser%
echo Git user email:
echo %gitemail%
echo Bash chromium sources path:
echo %shchromepath%
echo Bash switch to stable branch script path:
echo %shstablebranchscript%
echo Bash log path:
echo %shlogfile%
echo Fix these settings in script and run it again, if neccesary
echo =========================================================================
echo == Download Chromium Sources it takes about 1 hour... current time - %TIME%
echo =========================================================================
if exist %logfile% del %logfile%
call %getchromiumscript% >> %logfile%  2>&1
REM echo Hit enter to continue
REM pause > nul
cd %scriptfolder%
echo =========================================================================
echo == Switching to Chromium Stable. Current time - %TIME%"
echo =========================================================================
call %mingwsh% --login -i %shstablebranchscript% %gituser% %gitemail% %shchromepath% >> %logfile% 2>&1
REM following do under cmd delete files manually 
REM echo Hit enter to continue
REM pause > nul
cd %chromepath%
call gclient sync --jobs 16  >> %logfile% 2>&1
REM echo Hit enter to continue
REM pause > nul
REM --nohooks
echo =========================================================================
echo == Building Chromium Stable it takes about 3 hours. Current time - %TIME%"
echo =========================================================================
cd %scriptfolder%
call %buildchromiumscript%  >> %logfile% 2>&1
echo =========================================================================
echo == Done! Current time - %TIME%"
echo == Chromium stable installer can be found under %chromepath%\src\out\Release\mini_installer.exe
echo == Hit Enter to exit.
echo =========================================================================
pause > nul
