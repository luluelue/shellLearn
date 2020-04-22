#!/usr/bin/env bash

md5_target_dir=/root
md5file=md5.txt

find "$md5_target_dir" -type f | while read -r line; do
    md5sum "$line" >> "$md5file"
done