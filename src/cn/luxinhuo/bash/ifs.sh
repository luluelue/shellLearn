#!/usr/bin/env bash
echo "正在练习条件语句"
echo "请输入您的测试数字"
read -r num
#判断字符串是否为数值
if [ "$num" -gt 0 ] 2>/d  ev/null; then
  echo "num 是数值"
else
  echo "num不是数值，现在退出"
  exit
fi

if [ "$num" -ge 90 ]; then
  echo "您的分数很优秀"
fi
if [ "$num" -ge 80 -a "$num" -lt 90 ]; then
  echo "您的分数是优秀的"
fi
if [ "$num" -ge 60 -a "$num" -lt 80 ]; then
  echo "您的分数及格"
fi

if [ "$num" -gt 0 -a "$num" -lt 60 ]; then
  echo "您的分数不及格。请回家种田"
fi

