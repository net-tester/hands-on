#!/bin/bash
# this script requires root privileges

ip l set dev ens5 up
ip l set dev ens6 up

ip l add psw-port1 type veth peer name ssw-port1
ip l set dev psw-port1 up
ip l set dev ssw-port1 up

ovs-vsctl add-br PSW
ip l set PSW up
ovs-vsctl set bridge PSW fail_mode=secure
ovs-vsctl set-controller PSW tcp:127.0.0.1:6653
ovs-vsctl set bridge PSW other-config:datapath-id=0000000000000001
ovs-vsctl set bridge PSW protocols=OpenFlow10
ovs-vsctl set controller PSW max_backoff=1000
ovs-vsctl add-port PSW psw-port1 vlan_mode=trunk
ovs-vsctl add-port PSW ens5 vlan_mode=trunk
ovs-vsctl add-port PSW ens6 vlan_mode=trunk

