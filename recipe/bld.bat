REM Diagnostic: show where (if anywhere) flang_rt files live in this environment
echo BUILD_PREFIX: %BUILD_PREFIX%
where lld-link 2>nul && echo lld-link found in PATH || echo lld-link NOT in PATH
dir /s /b "%BUILD_PREFIX%\*flang_rt*" 2>nul || echo No flang_rt files found in BUILD_PREFIX

REM MSVC link.exe reads the LINK env var for extra options directly.
REM Suppress the /defaultlib:flang_rt.runtime.dynamic.lib directive that
REM flang 21 embeds in compiled Fortran .obj files.
set "LINK=/NODEFAULTLIB:flang_rt.runtime.dynamic.lib %LINK%"

%PYTHON% -m pip install . --no-build-isolation --no-deps -vv -Csetup-args=-Db_vscrt=none
if errorlevel 1 exit /b 1
