filename=$(yt-dlp --print filename --no-simulate -P ~/.cache/yt-dlp "$1")
mpv --speed=3 "$filename"
rm "$filename"
