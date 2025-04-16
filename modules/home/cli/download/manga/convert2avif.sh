#!/usr/bin/env bash

find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print | parallel --eta --bar magick {} {.}.avif
find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -delete
