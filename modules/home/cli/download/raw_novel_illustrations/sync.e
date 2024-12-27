#!/usr/bin/env execlineb

if { gallery-dl -x urls.txt }
if {
	execline-cd gallery-dl/imgbox rclone copy . "e5:raw_novel_illust" -P
}
rm -rf gallery-dl
