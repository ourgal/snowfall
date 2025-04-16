#!/usr/bin/env bash

adb devices -l
adb push "$(find ./ -maxdepth 1 -type d | fzf)/" /sdcard/manga/
