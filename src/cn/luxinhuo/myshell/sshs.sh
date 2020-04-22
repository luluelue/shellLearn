#!/usr/bin/env bash

ip=$1
password=$2

auto_sshkey_copy(){
  expect -c "set timeout -1;
  spawn /usr/bin/ssh-copy-id -i /root/.ssh/id_rsa.pub root@$1;

  expect{
    *(yes/no)* {send-- yes\r;exp_continue;}
    *Password:* {send-- $2\r;exp_continue;}
    eof       {exit o;}
  }";
}

auto_sshkey_copy "$ip" "$password"