REM flang 21 requires lld-link (not MSVC link.exe) to resolve its runtime library
set "FC_LD=lld-link"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
