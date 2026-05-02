%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=from_buildenv
if errorlevel 1 exit /b 1
