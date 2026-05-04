REM Replicate the libpaths flang adds when it drives a link, so MSVC link.exe
REM (invoked directly by meson for the .pyd) finds flang_rt.runtime.dynamic.lib.
for /d %%i in ("%BUILD_PREFIX%\Library\lib\clang\*") do set "LIB=%%i\lib\windows;%LIB%"
set "LIB=%BUILD_PREFIX%\Library\lib;%LIB%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
