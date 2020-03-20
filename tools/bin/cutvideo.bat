@echo off
if [%1]==[] (
	echo Missing video.
	goto:EOF
)
IF NOT EXIST %1 (
	echo Please, insert a valid file.
	goto:EOF
)
IF [%2]==[] (
	set OUTPUT="%~n1CutVideo.mp4"
) ELSE (
	set OUTPUT="%~n2.mp4"
)

echo Tempo de inicio:
set /p start=
echo Tempo de fim:
set /p end=

ffmpeg -i %1 -ss %start% -c copy -t %end% %OUTPUT%

echo Success.