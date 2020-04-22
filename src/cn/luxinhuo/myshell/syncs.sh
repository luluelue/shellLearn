#!/usr/bin/env bash

rsync_server=192.168.71.131
rsync_user=lulu
rsync_module=backup
rsync_log=/var/run/rsync.log
#本地与服务器同步的文件夹
local_dir=/root/sync
password_file=/etc/rsync.sec

function run_rsync() {
  echo "Starting Rsync at $(date '+%Y-%m-%d %H:%M:%S')" | tee -a rsync_log
  rsync -vzrtopg --progress --delete ${rsync_user}@${rsync_server}::${rsync_module} ${local_dir} --password-file=${password_file}
  echo "Rsync finished at $(date '+%Y-%m-%d %H:%M:%S')" | tee -a rsync
}

function test_live() {
  if ! ping "$rsync_server" -c 3 -w 3; then
    echo "Rsync Server down at $(date '+%Y-%m-%d %H:%M:%S')" | tee -a "$rsync_log"
    exit 1
  fi
}
test_live > /dev/null 2>&1
run_rsync
