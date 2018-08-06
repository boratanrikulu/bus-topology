#!/bin/bash

setName() {
	ip link set dev enp0s8 down
	ip link set dev enp0s8 name CtoB
	ip link set dev CtoB up
}

setIPs() {
	ip addr add 192.168.4.4/24 dev CtoB # sets the Device C IP for vboxnet1
	ip route add 192.168.3.0/24 dev CtoB via 192.168.4.2 # sets Device B as the router to access Device A
}

main() {
	setName
	setIPs
	ip addr # show the results
}

main