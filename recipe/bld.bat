:: pgmath.lib (classic flang vectorised-math runtime) is absent from the
:: conda-forge flang package. Build a stub static library so the linker
:: can proceed; no pgmath symbols are referenced by the compiled Fortran,
:: so the stub is never pulled into the final .pyd.
echo int pgmath_stub = 0; > pgmath_stub.c
cl /nologo /c pgmath_stub.c /Fopgmath_stub.obj
lib /nologo /out:pgmath.lib /machine:x64 pgmath_stub.obj
del pgmath_stub.c pgmath_stub.obj

:: Use %CD% (absolute path) not "." — the linker runs from the meson build
:: directory, so a relative path would point to the wrong place.
set "LIB=%CD%;%LIB%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
