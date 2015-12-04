#! /bin/bash

#Nagios-check for number of fail2ban chains in iptables

#Include nominal value from .inc file
fail2ban_inc="/etc/fail2ban/fail2ban_nagios.inc"
if [ -f ${fail2ban_inc} ]; then
	source ${fail2ban_inc}
else
	echo "WARNING - Config not found!"
	exit 1
fi

chains_actual=`/usr/bin/sudo /sbin/iptables --list -n | /bin/egrep "Chain fail2ban|Chain f2b" | /usr/bin/wc -l`

if [ ${chains_nominal} -eq ${chains_actual} ]
then
	echo "OK - Number of chains is ${chains_actual}"
	exit 0
else
	echo "CRITICAL - Number of chains doesn't match (${chains_actual} instead of ${chains_nominal})"
	exit 2
fi

echo "WARNING - Check failed"
exit 1
