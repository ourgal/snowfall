#!/usr/bin/env bash
yt-dlp --trim-filenames 50 -P ~/Music -f 'ba' -x --audio-format mp3 "$1"
