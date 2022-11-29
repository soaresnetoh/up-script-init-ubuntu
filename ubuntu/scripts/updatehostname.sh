#!/bin/bash

# instanceName=$([ -z $1 ] && echo "Vazia" || echo $1 )
instanceName=$([ -z $1 ] && echo "[Ramper] V3" || echo $1 )

hostname=$(echo $instanceName | sed  's/[[:space:]]/-/g' | sed -n 's/[[:alnum:]-]//gp')
hostname=$(echo $instanceName | sed  's/[[:space:]]/-/g' | sed -n 's/[^[:alnum:]-]//gp')
# hostnamectl set-hostname $hostname
echo -e "instanceName:$instanceName / hostname:$hostname"