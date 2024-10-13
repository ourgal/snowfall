removeAllDownloads() {
  ids=$(transmission-remote --list | awk 'NR > 1 && $1 != "Sum:" && $2 == "100%" {print $1}' | sed 's/\*//')
  for id in $ids; do
    transmission-remote -t "$id" -r
  done
}

removeDownload() {
  transmission-remote -t "$1" -r
}

download() {
  transmission-remote -w ~/Videos/anime --trash-torrent --add "$1"
}

watch_tewi() {
  tewi
}

watch() {
  viddy transmission-remote --list
}

help() {
  echo "\
  anime
    tewi
  anime <URL>
    download
  anime w | watch
    watch cli stats
  anime c | clear
    remove all downloads
  anime <ID>
    remove the download by id
  anime h | -h | help | --help
    show help"
}

if [ "$#" -eq 0 ]; then
  watch_tewi
else
  case "$1" in
  c | clear)
    removeAllDownloads
    ;;
  w | watch)
    watch
    ;;
  -h | h | --help | help)
    help
    ;;
  *[!0-9]*)
    download "$1"
    ;;
  *)
    removeDownload "$1"
    ;;
  esac
fi
