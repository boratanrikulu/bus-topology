#!/bin/bash

setName() {
	ip link set dev enp0s8 down
	ip link set dev enp0s8 name DtoB
	ip link set dev DtoB up
}

setIPs() {
	ip addr add 192.168.4.5/24 dev DtoB # sets the Device D IP for vboxnet1
	ip route add 192.168.3.0/24 dev DtoB via 192.168.4.2 # sets Device B as the router to access Device A
}

main() {
	setName
	setIPs
	ip addr # show the results
}

main