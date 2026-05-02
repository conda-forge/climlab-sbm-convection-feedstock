REM pgmath.lib (classic flang vectorised-math runtime) is absent from the
REM conda-forge flang package. Build a stub static library so the linker
REM can proceed; no pgmath symbols are referenced by the compiled Fortran.
echo int pgmath_stub = 0;> pgmath_stub.c
cl /nologo /c pgmath_stub.c /Fopgmath_stub.obj
lib /nologo /out:pgmath.lib /machine:x64 pgmath_stub.obj
del pgmath_stub.c pgmath_stub.obj

REM Use %CD% not "." -- the linker runs from the meson build directory,
REM so a relative path would miss the stub we just created here.
set "LIB=%CD%;%LIB%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
