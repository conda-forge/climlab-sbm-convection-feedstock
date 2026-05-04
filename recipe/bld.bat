REM conda-forge ships flang_rt.runtime.static.lib but not the dynamic variant.
REM Force static Fortran runtime, and add its directory to LIB so MSVC link.exe
REM finds it (flang adds these paths automatically when it drives a link, but
REM meson invokes link.exe directly for the .pyd).
set "FFLAGS=-fms-runtime-lib=static"
for /d %%i in ("%BUILD_PREFIX%\Library\lib\clang\*") do set "LIB=%%i\lib\windows;%LIB%"
set "LIB=%BUILD_PREFIX%\Library\lib;%LIB%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
