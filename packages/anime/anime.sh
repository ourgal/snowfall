#!/usr/bin/env bash
if [ "$#" -gt 0 ] && [[ "$1" =~ ^[0-9]+$ ]]; then
  transmission-remote -t "$1" -r
elif [ "$#" -gt 0 ] && [[ "$1" == "clear" ]]; then
  ids=$(transmission-remote --list | awk 'NR > 1 && $1 != "Sum:" && $2 == "100%" {print $1}' | sed 's/\*//')
  for id in $ids; do
    transmission-remote -t "$id" -r
  done
elif [ "$#" -gt 0 ]; then
  transmission-remote -w ~/Videos/anime --trash-torrent --add "$1"
else
  viddy transmission-remote --list
fi
