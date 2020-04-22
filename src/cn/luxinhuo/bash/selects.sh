#!/usr/bin/env bash

#select 与case 结合起来使用
select day in mon tue wed thu fri sat sun; do
    case $day in
    mon) echo "你选择的是周一";;
    tue) echo "你选择的是周二";;
    wed) echo "你选择的是周三";;
    thu) echo "你选择的是周四";;
    fri) echo "你选择的是周五";;
    sat) echo "你选择的是周六";;
    sun) echo "你选择的是周日";;
    *) echo "unkonw" && break
    esac
    break
done
