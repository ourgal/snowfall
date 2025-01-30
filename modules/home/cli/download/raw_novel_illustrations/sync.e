#!/usr/bin/env execlineb

if { gallery-dl -x urls.txt }
if {
	execline-cd gallery-dl/imgbox rclone copy . "alist:/189cloud_crypt/raw_novel_illust" -P
}
rm -rf gallery-dl
