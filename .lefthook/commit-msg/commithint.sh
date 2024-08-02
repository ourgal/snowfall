#!/usr/bin/env bash

# .lefthook/commit-msg/commithint.sh
head -n1 "$1" | cz check
