#!/usr/bin/env bash

find . -type f \( -iname "*.webp" -o -iname "*.avif" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec dirname {} \; | sort -u | parallel --eta --bar 7z a -tzip {}.cbz {}/
find . -type f \( -iname "*.webp" -o -iname "*.avif" -o -iname "*.jpg" -o -iname "*.jpeg" \) -delete
find . -type d -empty -delete
