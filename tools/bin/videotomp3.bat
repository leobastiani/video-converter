@ECHO OFF

set output=%2
IF [%2]==[] (
	set output=%~n1
)

ffmpeg -i %1 -q:a 0 -map a "%output%.mp3"