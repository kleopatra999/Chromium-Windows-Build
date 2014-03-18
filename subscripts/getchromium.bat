@echo off
cd %chromepath%
REM don't run this script separately. this is part of makechromiumstable.bat.
REM gclient several times forces depot tools to download necessaries 
call gclient
call gclient
call gclient
call gclient
call fetch --nohooks chromium --nosvn=True
cd %chromepath%\src
call gclient sync --with_branch_heads
