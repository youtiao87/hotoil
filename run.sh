#!/bin/sh

# Config
PROXY_IP="192.168.1.159"
PROXY_PORT="8080"
THAT_MAC="E8:50:8B:19:1F:62"


# Script
echo Running on $PROXY_IP on port $PROXY_PORT on device $THAT_MAC

sudo iptables -t nat -I PREROUTING 1 -m mac --mac-source $THAT_MAC ! -d 192.168.1.0/24 -p tcp --dport 80 -j DNAT --to-destination $PROXY_IP:$PROXY_PORT

sudo iptables -t mangle -A FORWARD -s 192.168.1.0/24 -d $PROXY_IP/32 -j MARK --set-xmark 0x1/0x7

