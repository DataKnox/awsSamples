#!/bin/bash
export AWS_CONFIG_FILE="/home/ubuntu/.aws/config"
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
USEDMEMORY=$(free -m | awk 'NR==2{printf "%.2f\t", $3*100/$2 }')
TCP_CONN=$(netstat -an | wc -l)
TCP_CONN_PORT_80=$(netstat -an | grep 80 | wc -l)
USERS=$(uptime |awk '{ print $6 }')
IO_WAIT=$(iostat | awk 'NR==4 {print $5}') 
/home/ubuntu/.local/bin/aws cloudwatch put-metric-data --metric-name memory-usage --dimensions Instance=$INSTANCE_ID  --namespace "CBT_Custom" --value $USEDMEMORY
/home/ubuntu/.local/bin/aws cloudwatch put-metric-data --metric-name tcp_connections --dimensions Instance=$INSTANCE_ID  --namespace "CBT_Custom" --value $TCP_CONN
/home/ubuntu/.local/bin/aws cloudwatch put-metric-data --metric-name tcp_connection_on_port_80 --dimensions Instance=$INSTANCE_ID  --namespace "CBT_Custom" --value $TCP_CON>
/home/ubuntu/.local/bin/aws cloudwatch put-metric-data --metric-name no_of_users --dimensions Instance=$INSTANCE_ID  --namespace "CBT_Custom" --value $USERS
/home/ubuntu/.local/bin/aws cloudwatch put-metric-data --metric-name io_wait --dimensions Instance=$INSTANCE_ID  --namespace "CBT_Custom" --value $IO_WAIT