#!/usr/bin/env bash

timestamp=$(date +'%Y-%m-%d %H:%M:%S')
current_html="${timestamp}.html"
current_index=index.html
#这份服务器列表需要提供
server_list=server.txt
dos2unix
#server_line=www.baidu.com

cat <<EOF >"$current_html"
<html>
<head>
<title> server alive test</title>
</head>


<body>
<table width="50%" border="1" cellpading="1" cellspaceing="0" align="center">
<caption><h2>Server Alive Status</h2></caption>
<tr><th>Server IP</th><th>Server Status</th></tr>
EOF

while read -r server_line; do
  echo "${server_line}"

#判断命令是否执行成功
  if ping "$server_line" -c 3; then
    status=OK
    color=blue
  else
    status=FALSE
    color=red
  fi
  echo "<tr><td>$server_line</td><td><font color=$color>$status</font></td></tr>" >>"$current_html"
done < "$server_list"

cat <<EOF >>"$current_html"
</table>
</body>


</html>
EOF
