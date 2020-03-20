@ECHO OFF
call utf8

IF %0 == "%~0" (
	rem estou no executar
	pushd %desk%
) else (
	pushd %cd%
)

echo OutputFolder: %cd%

rem estou na linha de comando
IF [%1] NEQ [] (
	echo %*>%temp%\temp.txt
	goto:jmpCpb
)
nircmd clipboard writefile %temp%\temp.txt

:jmpCpb
youtube-dl -f "best[height<=320]" --output "%%(title)s.%%(ext)s" -a %temp%\temp.txt

for %%f in ("*.3gp") do (
	if exist "%%f" (
		call androidvideo "%%f"
		del "%%f"
	)
)
popd