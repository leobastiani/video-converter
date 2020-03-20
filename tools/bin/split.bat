@ECHO OFF
SETLOCAL EnableDelayedExpansion

if ["%~4"] == [""] (
    echo usage: split "file_in" "00:00:00" "00:10:00" "file_out"
    goto:eof
)

ffmpeg -ss %2 -t %3 -i %1 -acodec copy -vcodec copy %4