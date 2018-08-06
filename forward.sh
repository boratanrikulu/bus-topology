#!/bin/bash

C_IP=192.168.4.4
D_IP=192.168.4.5

delete_them_all() {
	iptables -t nat -F # deletes all nat rules
}

add_nat_rule() {
	iptables -t nat -A PREROUTING -p tcp --dport 80 -d 192.168.3.40 -j DNAT --to-destination "$1"
}

main() {
	if [[ "$1" == "c" ]]; then
		delete_them_all
		add_nat_rule "$C_IP" # adds Device C IP to forward
		echo "Process is Completed [C]."
	elif [[ "$1" == "d" ]]; then
		delete_them_all
		add_nat_rule "$D_IP" # adds Device D IP to forward
		echo "Process is Completed [D]."
	elif [[ "$1" == "off" ]]; then
		delete_them_all
		echo "All NAT Rules are Deleted."
	else
		echo "Please use only \"c\", \"d\" or \"off\" as the input"
	fi
}

main "$*"