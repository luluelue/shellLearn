#!/usr/bin/env bash
#利用ftp上传下载文件
get_filename="TestDownload"
put_filename="TestUpload"
server_ip="192.168.71.1"
username="anonymous"
password=""

ftp -n "$server_ip" << EOF
quote USER "$username"   #quote 为ftp的命令，可传入账号和密码
quote PASS "$password"

Binary   #指定传输方式是二进制
get "get_filename"  #get命令用于ftp中下载文件
cd upload
put "$put_filename"
EOF

