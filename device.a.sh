#!/bin/bash

setName() {
	ip link set dev enp0s8 down
	ip link set dev enp0s8 name AtoB
	ip link set dev AtoB up
}

setIPs() {
	ip addr add 192.168.3.3/24 dev AtoB # sets the Device A IP for vboxnet1
	ip route add 192.168.4.0/24 dev AtoB via 192.168.3.40 # sets Device B as the router to access Device C
}

main() {
	setName
	setIPs
	ip addr # show the results
}

main