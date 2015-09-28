@echo off

for %%* in (.) do set "PJT_NAM=%%~n*"
set CUR_DIR=%CD%
set REL_DIR=release
set SRC_DIR=sources
set TOL_DIR=buildTools
set EXE_PATH=%CUR_DIR%\%REL_DIR%\%PJT_NAM%.exe
set ICO_PATH=%CUR_DIR%\%SRC_DIR%\icon.ico
set NWEXE_PATH=%CUR_DIR%\%TOL_DIR%\nw\nw.exe
set NWZIP_PATH=%CUR_DIR%\app.nw

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

call :ColorText 0C "nodebob v0.1.0"
echo.
call :ColorText 0C "---"
echo.
echo.

if not exist %REL_DIR% md %REL_DIR%

echo.
call :ColorText 0a "Creating app package..."
cd %TOL_DIR%\7z
7z a -o{%CUR_DIR%} -tzip %NWZIP_PATH% %CUR_DIR%\%SRC_DIR%\*
cd ..\..

echo.
call :ColorText 0a "Creating executable..."
echo.
copy /b /y %NWEXE_PATH% %EXE_PATH%
cd %TOL_DIR%\ar
if exist %ICO_PATH% Resourcer -op:upd -src:%EXE_PATH% -type:14 -name:IDR_MAINFRAME -file:%ICO_PATH%
copy /b /y %EXE_PATH% + %NWZIP_PATH% %EXE_PATH%
cd ..\..

if not exist %CUR_DIR%\%REL_DIR%\nw.pak 		copy %CUR_DIR%\%TOL_DIR%\nw\nw.pak %CUR_DIR%\%REL_DIR%\nw.pak
if not exist %CUR_DIR%\%REL_DIR%\icudtl.dat 		copy %CUR_DIR%\%TOL_DIR%\nw\icudtl.dat %CUR_DIR%\%REL_DIR%\icudtl.dat
if not exist %CUR_DIR%\%REL_DIR%\ffmpegsumo.dll 	copy %CUR_DIR%\%TOL_DIR%\nw\ffmpegsumo.dll %CUR_DIR%\%REL_DIR%\ffmpegsumo.dll
if not exist %CUR_DIR%\%REL_DIR%\libEGL.dll 		copy %CUR_DIR%\%TOL_DIR%\nw\libEGL.dll %CUR_DIR%\%REL_DIR%\libEGL.dll
if not exist %CUR_DIR%\%REL_DIR%\libGLESv2.dll 		copy %CUR_DIR%\%TOL_DIR%\nw\libGLESv2.dll %CUR_DIR%\%REL_DIR%\libGLESv2.dll
if not exist %CUR_DIR%\%REL_DIR%\D3DCompiler_47.dll 	copy %CUR_DIR%\%TOL_DIR%\nw\D3DCompiler_47.dll %CUR_DIR%\%REL_DIR%\D3DCompiler_47.dll
if not exist %CUR_DIR%\%REL_DIR%\nwjc.exe 		copy %CUR_DIR%\%TOL_DIR%\nw\nwjc.exe %CUR_DIR%\%REL_DIR%\nwjc.exe
rem OMIT PDF.DLL
rem if not exist %CUR_DIR%\%REL_DIR%\pdf.dll 		copy %CUR_DIR%\buildTools\nw\pdf.dll %CUR_DIR%\%REL_DIR%\pdf.dll

echo.
call :ColorText 0a "Deleting temporary files..."
echo.
del %NWZIP_PATH%

echo.
call :ColorText 0a "Done!"
echo.
goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
