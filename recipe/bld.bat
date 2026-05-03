REM Add conda-forge's flang-rt library directory to LIB so MSVC link.exe can
REM find flang_rt.runtime.dynamic.lib if lld-link is still not used.
set "LIB=%BUILD_PREFIX%\Library\lib;%LIB%"

REM Ensure lld-link is in PATH (it lives in Library\bin alongside flang),
REM then declare it as the Fortran linker so meson can actually find it.
set "PATH=%BUILD_PREFIX%\Library\bin;%PATH%"
set "FC_LD=lld-link"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
