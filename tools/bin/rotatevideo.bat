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
	set angle=90
) ELSE (
	set angle=%2
)
set OUTPUT="%~n1Rotate%2.mp4"
set /a angle=angle/90-1


ffmpeg -i %1 -vf transpose=%angle% %OUTPUT%

echo Success.