#!/bin/bash

setNames() {
	ip link set dev enp0s8 down
	ip link set dev enp0s8 name BtoA
	ip link set dev BtoA up

	ip link set dev enp0s9 down
	ip link set dev enp0s9 name BtoC
	ip link set dev BtoC up
}

setIPs() {
	ip addr add 192.168.3.40/24 dev BtoA # sets the Device B IP for vboxnet0
	ip addr add 192.168.4.2/24 dev BtoC # sets the Device B IP for vboxnet2

}

setIPForward() {
	ipForward=`cat /proc/sys/net/ipv4/ip_forward`

	if [[ "$ipForward" -eq "0" ]]; then # sets IP Forward as 1
		sysctl net.ipv4.ip_forward=1
	fi
}

main() {
	setNames
	setIPs
	setIPForward
	ip addr # show the results
}

main