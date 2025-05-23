function image() {
  feh "$@"
}

function youtube() {
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

  if ! yt-dlp -P "$path" "$@"; then
    yt-dlp -P "$path" "$@"
  fi

  latest_file=$(find "$path" -type f -name "*.mp4" -printf "%T@ %P\n" | sort -nr | cut -d' ' -f2- | head -n 1)
  mpv --speed=3 "$latest_file"
}

function bilibili() {
  mpv --speed=3 "$@"
}

function video() {
  mpv "$@"
}

function ff() {
  firefox "$@" &
}

function qute() {
  qutebrowser "$@"
}

case "$1" in
https://pbs.twimg.com* | *.jpg | *.png | *.webp)
  image "$@"
  ;;
https://www.youtube.com/watch*)
  ff "$@"
  ;;
https://www.bilibili.com/video*)
  bilibili "$@"
  ;;
https://video.twimg.com/*)
  video "$@"
  ;;
*)
  ff "$@"
  ;;
esac
