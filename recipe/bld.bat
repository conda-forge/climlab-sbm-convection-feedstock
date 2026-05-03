REM flang 21 runtime (flang_rt.runtime.dynamic.lib) lives alongside clang_rt in
REM lib/clang/<ver>/lib/windows; MSVC link.exe needs that directory in LIB.
for /d %%i in ("%BUILD_PREFIX%\lib\clang\*") do set "LIB=%%i\lib\windows;%LIB%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
