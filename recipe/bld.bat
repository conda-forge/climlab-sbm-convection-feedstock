:: flang runtime libs (flang.lib, pgmath.lib) live in the build env, not the host env.
:: Without this, MSVC link.exe cannot find pgmath.lib and fails with LNK1181.
set "LIB=%BUILD_PREFIX%\Library\lib;%LIB%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
