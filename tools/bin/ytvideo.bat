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
	set OUTPUT="%~n1YouTubeVideo.mp4"
) ELSE (
	set OUTPUT="%~n2.mp4"
)
:: funciona mto bem, mas resolvi fazer umas alterações
:: ffmpeg -i %1 -s 320x240 -vcodec mpeg4 -acodec aac -strict experimental -ac 1 -r 18 -ab 32000 output.mp4
:: esse foi o melhor
:: ffmpeg -i %1 -c:v libx264 -crf 18 -preset slow -c:a copy %OUTPUT%
:: agora eu mesclei com o de android
ffmpeg -i %1 -vcodec h264 -acodec aac -strict experimental %OUTPUT%

echo Success.