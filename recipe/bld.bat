REM Diagnostic: show where flang finds its runtime library
echo === flang resource dir ===
flang.exe -print-resource-dir
echo === flang search dirs ===
flang.exe -print-search-dirs
echo === verbose link of a minimal Fortran program ===
(echo program test) > _test_f.f90
(echo end program test) >> _test_f.f90
flang.exe -v _test_f.f90 -o _test_f.exe 2>&1
del _test_f.f90 _test_f.exe 2>nul
echo === end diagnostics ===

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
