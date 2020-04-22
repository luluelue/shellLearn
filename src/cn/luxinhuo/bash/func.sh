#!/usr/bin/env bash
function getFiles() {
    return 0
}
res=getFiles

echo "$res"


#给函数传递参数
function countLine() {
    local i=0
    while read -r line; do
        ((i+=1))
    done < "$1"
    echo "func.sh 有 $i 行"
}
countLine "func.sh"