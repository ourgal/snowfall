#!/usr/bin/env bash
case "$1" in
https://pbs.twimg.com* | *.jpg | *.png)
  feh "$@"
  ;;
https://www.youtube.com/watch*)
  path="$HOME/Downloads/youtube"

  cutoff_date=$(date -d "1 day ago" +%s)

  for file in "$path"/*; do
    if [ -f "$file" ]; then
      file_mtime=$(date -r "$file" +%s)
      if [ "$file_mtime" -lt "$cutoff_date" ]; then
        rm "$file"
      fi
    fi
  done

  if ! yt-dlp -P "$path" -f 22 "$@"; then
    yt-dlp -P "$path" "$@"
  fi

  latest_file=$(ls -t --time=creation $path/*.mp4 | head -n 1)
  mpv --speed=3 "$latest_file"
  ;;
https://www.bilibili.com/video*)
  mpv --speed=3 "$@"
  ;;
https://video.twimg.com/*)
  mpv "$@"
  ;;
*)
  firefox "$@" &
  ;;
esac
