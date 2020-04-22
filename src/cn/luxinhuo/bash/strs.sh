#!/usr/bin/env bash
str1="asdf"
str2="oert"
str3="asdf"

if [[ $str1 = $str3 ]]; then
  echo "True"
fi

read -rp "请输入一个数值: " input
echo "$input"
case $inpur in
  *[[:lower:]]*) echo "lowercase" ;;
  *[[:upper:]]*) echo "Uppercase" ;;
  *[[:digit:]]*) echo "num" ;;
  *) echo "unknow input";;
esac

