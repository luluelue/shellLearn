#!/usr/bin/env bash
read -rp "请输入数据：" num
case "$num" in
[1-9][0-9]*) echo "您输入的是正确数值" ;;
[^0-9]*) echo "您输入的是纯字符" ;;
*) echo "您输入的并非数值类型" ;;
esac

case $OS in
FreeBAD) echo "this is FreeBSD" ;;
SunOS) echo "this is Solaris" ;;
Linux) echo "this is Linux" ;;
Windows_NT) echo "this is win" ;;

*) echo "$OS is unknow os" ;;
esac
