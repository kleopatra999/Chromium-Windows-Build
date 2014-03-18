REM configure api keys setup  C:\Users\yourusername\.gyp\include.gypi  
REM don't run this script separately. this is part of makechromiumstable.bat.
echo %chromepath%
cd %chromepath%
cd %chromepath%\src
pwd
set GYP_GENERATORS=ninja
call gclient runhooks
call python build\gyp_chromium
call ninja -C out/Release chrome.exe
ninja -C out/Release mini_installer.exe
REM cd %chromepath%\src\out\Release
REM call "C:\depot_tools\win_toolchain\vs2013_files\win8sdk\bin\x86\signtool.exe" sign mini_installer.exe
