#!/usr/bin/env bash

find . -type f -name "*.cbz" | parallel --eta --bar 7z x {} -o{//}
find . -type f -name "*.cbz" -delete
find . -type d -empty -delete
