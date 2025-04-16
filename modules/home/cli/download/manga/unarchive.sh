#!/usr/bin/env bash

password=$(tr -s '\n' <password)
readonly password
found=0

getFilename() {
  local -r path=$1
  local filename
  filename=$(basename "$path")
  filename=${filename%%.*}
  echo "$filename"
}

7zList() {
  local -r file="$1"
  7z l "$file" -p"$password"
}

7zCheckImg() {
  local -r file="$1"

  if grep -q '\.\(jpg\|png\|jpeg\)' <(7zList "$file"); then
    found=1
    export found
  fi
}

unrarList() {
  local -r file="$1"
  unrar l "$file" -p"$password" -c-
}

unrarCheckImg() {
  local -r file="$1"

  if grep -q '\.\(jpg\|png\|jpeg\)' <(unrarList "$file"); then
    found=1
    export found
  fi
}

findFirst() {
  local -r str="$1"
  find . -type f -name "$str" -print | head -n1
}

findDelete() {
  local -r str="$1"
  find . -type f -name "$str" -delete
}

unrarFile() {
  local -r file="$1"
  local -r filename=$(getFilename "$file")

  unrar x "$file" "$filename/" -p"$password" -x*公众号*
}

unzipFile() {
  local -r file="$1"
  local -r filename=$(getFilename "$file")

  7z x "$file" -p"$password" -o"${filename}/"
}

unpack() {
  local -r file="$1"
  if grep -q RAR <(file "$file"); then
    unrarFile "$file"
  elif grep -q zip <(file "$file"); then
    unzipFile "$file"
  fi
}

autoUnpack() {
  local -r files=$(find . -type f -size +50M)
  if [[ $(echo "$files" | wc -l) -eq 1 ]]; then
    local -r file=$files
    unpack "$file"
    rm "$file"
  elif grep -q ".*.7z.001" <(echo "$files"); then
    local -r file=$(grep ".*.7z.001" <(echo "$files"))
    unpack "$file"
    findDelete "*.7z.*"
  elif grep -q ".*.part1.rar" <(echo "$files"); then
    local -r file=$(grep ".*.part1.rar" <(echo "$files"))
    unpack "$file"
    findDelete "*.part*.rar"
  else
    return 1
  fi
}

while autoUnpack; do
  true
done
