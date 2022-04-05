#!/usr/bin/env bash

MONITOR_PUB_IP=$(cat /var/lib/jenkins/workspace/Monitoring-stack/hosts-monitoring-stack.txt)
SLAVE_PUB_IP=$(cat /var/lib/jenkins/workspace/Monitoring-stack/hosts-worker.txt)


sed -i -e "s/MONITOR_PUB_IP/${MONITOR_PUB_IP}/" ./prometheus.yml
sed -i -e "s/SLAVE_PUB_IP/${SLAVE_PUB_IP}/" ./prometheus.yml
sed -i -e "s/prometheus:9090/${MONITOR_PUB_IP}:9090/" ./datasource.yml
