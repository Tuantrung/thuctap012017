#!/bin/bash

#Author Son Do Xuan

source function.sh

IP=$1


ssh-keygen -t rsa -N "" -f mykey
ssh-copy-id -i mykey.pub root@$IP

ssh -i mykey root@$IP <<EOF
# OpenStack packages (python-openstackclient)
echocolor "Install OpenStack client"
sleep 3
apt-get install software-properties-common -y
add-apt-repository cloud-archive:ocata -y
apt-get update -y && apt-get dist-upgrade -y

apt-get install python-openstackclient -y
EOF

