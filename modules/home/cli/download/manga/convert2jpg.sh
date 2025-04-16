#!/usr/bin/env bash

find . -type f \( -iname "*.png" \) -print | parallel --eta --bar magick {} {.}.jpg
find . -type f \( -iname "*.png" \) -delete
