#!/bin/bash
### vars.sh ####
instanceName='[Ramper] V3'

updateHostname () {
    #Limpando instanceName
    hostname=$(echo $instanceName | sed  's/[[:space:]]/-/g' | sed -n 's/[^[:alnum:]-]//gp')

    #setando hostname
    hostnamectl set-hostname $hostname
}

updateHostname