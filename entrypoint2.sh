#!/bin/sh

resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n" )
echo "---------------------------------------------"
echo $resultip
#ss-server -s 0.0.0.0 -p 3721 -k laogao -m aes-256-cfb -t 300 -d 8.8.8.8 -d 8.8.4.4 -u -f /root/data/ss.pid &
ss-server -c ./ss-config.json &
./server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2& 
./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 
