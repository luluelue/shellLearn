#!/usr/bin/env bash
arr=(a b c d e)
#注意：下面取数组所有值，只能使用@ ，而不能使用*
for i in "${arr[@]}"; do
  echo "当前循环输出的元素是：$i"
done

#循环输出当前文件夹下所有文件
for j in $(ls); do
  [[ -e "$j" ]] || break
  ls -l "$j"
done

#常规的for...i 循环的实现
sum=0
for n in {1..100}; do
  ((sum += n))
done
echo $sum

#设置步长为2
sum=0
for k in $(seq 1 2 100); do
  ((sum += k))
done
echo $sum

#得到所有传入的参数
for arg in "$@"; do
  echo "$arg"
done

#类似c语言的for循环
for ((i = 0, j = 100; i < 10; i++, j--)); do
  if [ "$i" -eq 8 ]; then
    echo "i的值为8"
  fi
  echo "$i"
done

i=100
while [ $i -gt 0 ]; do
#    echo "i值大于0"
    ((i-=1))
done

#while true; do
#    echo "死循环"
#    ((i-=1))
#done
#while ((1)); do
#    echo "死循环"
#done
echo "-----------------++++++++++++++++++++++-----------------"
#
#while read -r line; do
#  echo "$line"
#done < fors.sh

i=100
#当设置的条件为true时，退出循环
until [  $i -le 0  ]; do
    echo "i值大于0"
    ((i-=1))
done

select day in mon tue wed thu fri sat sun; do
    case $day in
    mon) echo "你选择的是周一"

      ;;
    esac
done