#!/usr/bin/env bash
array=(1 2 3 4 5 6 7 8 9)
array1=("a" "b" "c" "d")

#打印数组内元素
echo "${array[2]}"

#截取数组
echo "${array[@]:1:5}"

#
conn=(${array[@]} ${array1[@]})
echo "${conn[0]}"
echo "$SHLVL"

date1=$(date)
#sleep 1
date2=`date`
echo $(date)
echo "$date1"

echo $[1+23]
expr 1 + 1

[ -e G:/java_project/test1/src/cn/luxinhuo/bash ]
echo $?

str2="aa"
str3="bb"
 [[ $str3 > $str2 ]]
 echo "大小为：$?"

