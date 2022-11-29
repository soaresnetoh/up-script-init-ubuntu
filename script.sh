#!/bin/bash
#

 
### BEGIN INIT INFO
# Provides:          iptables
# Required-Start:    $local_fs $syslog
# Required-Stop:     $local_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Update iptables at boot
# Description:       Update iptables 
### END INIT INFO

data=$(date)

# Path to Apache controller
tBASH=$(which bash)
tIPTABLES=$(which iptables)

 
function iniciandoFirewall()
{
	echo -e "Configurando firewall... - $data" >> /vagrant/logs.txt

	$tIPTABLES -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
    $tIPTABLES -I INPUT -p tcp --dport 8080 -j ACCEPT
    
    $tIPTABLES -L
    $tIPTABLES -L -t nat

}
 
function liberandoFirewall()
{
	echo -e "Liberando firewall... - $data" >> /vagrant/logs.txt
    $tIPTABLES -F
    $tIPTABLES -F -t nat
	
}
# {
# 	echo -e "Librando firewall... - $data" >> /tmp/logs.txt
#     # Accept all traffic first to avoid ssh lockdown  via iptables firewall rules #
#     $tIPTABLES -P INPUT ACCEPT
#     $tIPTABLES -P FORWARD ACCEPT
#     $tIPTABLES -P OUTPUT ACCEPT
    
#     # Flush All Iptables Chains/Firewall rules #
#     $tIPTABLES -F
    
#     # Delete all Iptables Chains #
#     $tIPTABLES -X
    
#     # Flush all counters too #
#     $tIPTABLES -Z 
#     # Flush and delete all nat and  mangle #
#     $tIPTABLES -t nat -F
#     $tIPTABLES -t nat -X
#     $tIPTABLES -t mangle -F
#     $tIPTABLES -t mangle -X
#     $tIPTABLES -t raw -F
#     $tIPTABLES -t raw -X

#     $tIPTABLES -L
#     $tIPTABLES -L -t nat

# }
 
case "$1" in
	start )
		iniciandoFirewall
		if [ $? -eq 0 ]
		then
			echo "OK."
		fi
 
		;;
 
 
	stop )
		liberandoFirewall
		if [ $? -eq 0 ]
		then
			echo "OK."
		fi
 
		;;
 
	restart )
		liberandoFirewall
		sleep 1
		iniciandoFirewall
		if [ $? -eq 0 ]
		then
			echo "OK."
		fi
 
		;;
 
	* )
		echo "Invalid option"
		;;
esac