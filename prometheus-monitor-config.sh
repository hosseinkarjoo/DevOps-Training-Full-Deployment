#!/usr/bin/env bash

MONITOR_PUB_IP=$(curl ipv4.icanhazip.com)
MONITOR_PRV_IP=$(/usr/sbin/ip a show eth0 | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1)


sed -i '' -e "s/MONITOR_PUB_IP/${MONITOR_PUB_IP}/" ./prometheus.yml
sed -i '' -e "s/MONITOR_PRV_IP/${MONITOR_PRV_IP}/" ./prometheus.yml
