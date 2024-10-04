#!/usr/bin/env bash

# .lefthook/commit-msg/commitlint.sh
head -n1 "$1" | cz check
