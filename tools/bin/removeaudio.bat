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
	set OUTPUT="%~n1AudioRemoved.mp4"
) ELSE (
	set OUTPUT="%~n2.mp4"
)
:: funciona mto bem, mas resolvi fazer umas alterações
:: ffmpeg -i %1 -s 320x240 -vcodec mpeg4 -acodec aac -strict experimental -ac 1 -r 18 -ab 32000 output.mp4
ffmpeg -i %1 -vcodec copy -an %OUTPUT%

echo Success.