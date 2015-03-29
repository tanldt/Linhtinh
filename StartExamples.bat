@echo off
SET LocalProgramFiles="%ProgramFiles(x86)%"
IF %LocalProgramFiles% == "" SET LocalProgramFiles="%ProgramFiles%"
set currentdir=%cd%
pushd "%LocalProgramFiles%\Common Files\microsoft shared\DevServer\10.0\"
start WebDev.WebServer40.EXE /port:14054 /path:"%currentdir%"
start http://localhost:14054/QuanLyCafeTestPage.aspx
popd