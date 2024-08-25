function removeAllDownloads() {
  ids=$(transmission-remote --list | awk 'NR > 1 && $1 != "Sum:" && $2 == "100%" {print $1}' | sed 's/\*//')
  for id in $ids; do
    transmission-remote -t "$id" -r
  done
}

function removeDownload() {
  transmission-remote -t "$1" -r
}

function download() {
  transmission-remote -w ~/Videos/anime --trash-torrent --add "$1"
}

function watch() {
  viddy transmission-remote --list
}

function help() {
  echo "\
  anime <URL>
    download
  anime clear
    remove all downloads
  anime <ID>
    remove the download by id"
}

if [ "$#" -eq 0 ]; then
  watch
else
  case "$1" in
  "clear")
    removeAllDownloads
    ;;
  "")
    viddy transmission-remote --list
    ;;
  "-h")
    help
    ;;
  "--help")
    help
    ;;
  "help")
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
