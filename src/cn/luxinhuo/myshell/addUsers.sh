#!/usr/bin/env bash

USER_INFO=/root/addusers.txt

#cut -f 指定输出哪些字段，后面的数值就是所需字段的列号,-d 指定列的分隔符
while read -r line; do
  username=$(echo "$line" | cut -f 1 -d' ')
  password=$(echo "$line" | cut -f 1 -d' ')

  useradd "$username"
  if [ $? -ne 0 ]; then
      echo "$username 已经存在，跳过"
  else
      echo "$password" | password --stdin "$username"
  fi
done < $USER_INFO

cat << EOF >aa.txt
echo "aa"
echo "bb"
echo "cc"
EOF