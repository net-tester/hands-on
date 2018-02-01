#!/bin/bash

for i in internal dmz internet ; do
    /sbin/ip l add name nt_${i} type veth peer name vyos_${i}
    /sbin/ip l set up dev nt_${i}
    /sbin/ip l set up dev vyos_${i}
    /sbin/ip l set promisc on dev nt_${i}
    /sbin/ip l set promisc on dev vyos_${i}
done
/sbin/ip l add name yo_global type veth peer name ta_global
/sbin/ip l set up dev yo_global
/sbin/ip l set up dev ta_global
/sbin/ip l set promisc on dev yo_global
/sbin/ip l set promisc on dev ta_global

