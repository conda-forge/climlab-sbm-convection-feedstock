:: Derive flang's lib directory from the Fortran compiler path (FC).
:: BUILD_PREFIX is not reliably set in conda-build native Windows builds,
:: but FC always points to flang.exe in Library\bin\, so lib is the sibling dir.
for %%i in ("%FC%") do set "FC_BIN=%%~dpi"
for %%F in ("%FC_BIN%..\lib") do set "FLANG_LIB=%%~fF"
set "LIB=%FLANG_LIB%;%LIB%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
