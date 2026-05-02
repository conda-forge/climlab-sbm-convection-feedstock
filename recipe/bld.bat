mkdir builddir

meson setup %MESON_ARGS% builddir
if errorlevel 1 (
    type builddir\meson-logs\meson-log.txt
    exit /b 1
)

%PYTHON% -m build --wheel --no-isolation --skip-dependency-check -Cbuilddir=builddir
if errorlevel 1 exit /b 1

for /f "delims=" %%i in ('dir /b dist\climlab_sbm_convection*.whl') do set WHL=%%i
%PYTHON% -m pip install "dist\%WHL%"
if errorlevel 1 exit /b 1
