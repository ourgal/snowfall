#!/usr/bin/env bash
dir=~/Music/youtube_dl/
mkdir -p $dir
yt-dlp --trim-filenames 50 --no-write-subs --no-embed-subs --no-write-auto-subs -P $dir -f 'ba' -x --audio-format mp3 "$1"
