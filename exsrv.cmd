:: Utility Batch File To Start/Stop Elixir App As Windows Service
:: Onorio Catenacci
:: 19 November 2015

@echo off
SET COMMAND=%2
SET ERTS_BIN_PATH=C:/progra~1/erl7.1/erts-7.1/bin
SET ERLSRV_CMD=%ERTS_BIN_PATH%/erlsrv
SET APPNAME=%1

IF [%1]==[] (
CALL :HELP exsrv.cmd
GOTO :EOF
)
IF /I %COMMAND%==INSTALL (CALL :INSTALL)
IF /I %COMMAND%==START (CALL :START)
IF /I %COMMAND%==STOP (CALL :STOP)
IF /I %COMMAND%==REMOVE (CALL :REMOVE)
IF /I %COMMAND%==LIST (CALL :LIST)
GOTO :EOF

:HELP
SETLOCAL
ECHO %~1 appname command
ECHO Where command can be "INSTALL", "START", "STOP", "LIST" or "REMOVE"
ECHO Note that installing the service doesn't automatically start it but
ECHO removing a service will attempt to stop it before removing it.
ECHO You do have to pass an appname for the list command although the command
ECHO will list all erlsrv apps regardless.
ENDLOCAL
GOTO :EOF

:INSTALL
SETLOCAL
CALL :REMOVE
ECHO Installing %APPNAME% service
%ERLSRV_CMD% add %APPNAME% -machine %ERTS_BIN_PATH%/start_erl.exe -c "%APPNAME% Elixir Service" -w %TEMP% -n %APPNAME%@localhost -d reuse
ENDLOCAL
GOTO :EOF

:REMOVE
SETLOCAL
CALL :STOP
ECHO Removing %APPNAME% service
%ERLSRV_CMD% remove %APPNAME%
ENDLOCAL
GOTO :EOF

:START
SETLOCAL
%ERLSRV_CMD% start %APPNAME%
ENDLOCAL
GOTO :EOF

:STOP
SETLOCAL
ECHO Stopping %APPNAME% service
%ERLSRV_CMD% stop %APPNAME%
ENDLOCAL
GOTO :EOF

:LIST
SETLOCAL
ECHO Listing all erlsrv services
%ERLSRV_CMD% list
ENDLOCAL
GOTO :EOF

