#!/usr/bin/env bash

rename() {
  path="$1"
  newPath=$(echo "$path" | sed -E 's/第(.+)[话話]$/chapter_\1/')
  mv "$path" "$newPath"
}
export -f rename

parallel rename :::: <(grep '.\+/第.\+[话話]$' <(find . -type d))
