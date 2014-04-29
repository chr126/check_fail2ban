#! /bin/bash

<<<<<<< HEAD
#Nagios-Check für die Anzahl von fail2ban-chains in iptables

#Vergleichswert über Datei einlesen
fail2ban_inc="fail2ban.inc"
if [ -f ~/fail2ban_check_nagios_christoph/${fail2ban_inc} ]; then
        source ~/fail2ban_check_nagios_christoph//${fail2ban_inc}
=======
#Nagios-check for number of fail2ban chains in iptables

#Include nominal value from .inc file
fail2ban_inc="/etc/fail2ban/fail2ban_nagios.inc"
if [ -f ${fail2ban_inc} ]; then
        source ${fail2ban_inc}
>>>>>>> updated version with english comments
else
        echo "WARNING - Config not found!"
        exit 1
fi

<<<<<<< HEAD
fail=`iptables --list -n | grep "Chain fail2ban" | wc -l`

if [ ${chains} -eq ${fail} ]
then
	echo "OK - Number of chains is ${fail}"
	exit 0
else
	echo "CRITICAL - Number of chains doesn't match"
	exit 2
fi

exit 0
=======
chains_actual=`/usr/bin/sudo /sbin/iptables --list -n | /bin/grep "Chain fail2ban" | /usr/bin/wc -l`

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
>>>>>>> updated version with english comments
