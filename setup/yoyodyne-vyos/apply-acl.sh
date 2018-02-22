#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure
# global
set zone-policy zone glo
set zone-policy zone glo interface eth3

# dmz
set zone-policy zone dmz
set zone-policy zone dmz interface br0


# internal
set zone-policy zone int
set zone-policy zone int interface br1


set firewall name dmz default-action drop
set firewall name int default-action drop
set firewall name dmz1 default-action drop
set firewall name int2 default-action drop
set firewall name glo default-action drop
set firewall name glo1 default-action drop

set firewall name dmz enable-default-log
set firewall name int enable-default-log
set firewall name dmz1 enable-default-log
set firewall name int2 enable-default-log
set firewall name glo enable-default-log
set firewall name glo1 enable-default-log

del firewall name dmz rule
del firewall name int rule
del firewall name dmz1 rule
del firewall name int2 rule
del firewall name glo rule
del firewall name glo1 rule

set zone-policy zone dmz from int firewall name dmz
set zone-policy zone dmz from glo firewall name dmz1
set zone-policy zone int from dmz firewall name int
set zone-policy zone int from glo firewall name int2
set zone-policy zone glo from dmz firewall name glo
set zone-policy zone glo from int firewall name glo1


# glo->int
set firewall name int2 rule 100 protocol icmp
set firewall name int2 rule 100 action accept

set firewall name int2 rule 50 state established enable
set firewall name int2 rule 50 state related enable
set firewall name int2 rule 50 action accept

set firewall name int2 rule 200 protocol tcp_udp
set firewall name int2 rule 200 source port 123
set firewall name int2 rule 200 action accept


set firewall name int2 rule 300 protocol tcp_udp
set firewall name int2 rule 300 source port 53
set firewall name int2 rule 300 action accept


# glo->dmz

set firewall name dmz1 rule 100 protocol icmp
set firewall name dmz1 rule 100 action accept

set firewall name dmz1 rule 200 protocol tcp_udp
set firewall name dmz1 rule 200 source port 123
set firewall name dmz1 rule 200 action accept


set firewall name dmz1 rule 300 protocol udp
set firewall name dmz1 rule 300 source port 53
set firewall name dmz1 rule 300 action accept

set firewall name dmz1 rule 400 protocol tcp
set firewall name dmz1 rule 400 source port 53
set firewall name dmz1 rule 400 action drop

set firewall name dmz1 rule 500 state established enable
set firewall name dmz1 rule 500 state related enable
set firewall name dmz1 rule 500 action accept



# int->glo
set firewall name glo1 rule 100 protocol icmp
set firewall name glo1 rule 100 action accept

set firewall name glo1 rule 200 protocol tcp_udp
set firewall name glo1 rule 200 destination port 123
set firewall name glo1 rule 200 action accept


set firewall name glo1 rule 300 protocol tcp_udp
set firewall name glo1 rule 300 destination port 53
set firewall name glo1 rule 300 action accept

set firewall name glo1 rule 400 action accept
set firewall name glo1 rule 400 destination port 80,443
set firewall name glo1 rule 400 protocol tcp


# dmz->glo
set firewall name glo rule 100 protocol icmp
set firewall name glo rule 100 action accept

set firewall name glo rule 200 protocol tcp_udp
set firewall name glo rule 200 destination port 123
set firewall name glo rule 200 action accept


set firewall name glo rule 300 protocol tcp_udp
set firewall name glo rule 300 destination port 53
set firewall name glo rule 300 action accept

set firewall name glo rule 400 protocol tcp
set firewall name glo rule 400 destination port 80,443
set firewall name glo rule 400 action accept


# int->dmz
set firewall name dmz rule 100 protocol icmp
set firewall name dmz rule 100 action accept

set firewall name dmz rule 50 state established enable
set firewall name dmz rule 50 state related enable
set firewall name dmz rule 50 action accept

set firewall name dmz rule 200 protocol tcp_udp
set firewall name dmz rule 200 destination port 123
set firewall name dmz rule 200 action accept


set firewall name dmz rule 300 protocol tcp_udp
set firewall name dmz rule 300 destination port 53
set firewall name dmz rule 300 action accept

set firewall name dmz rule 400 protocol tcp
set firewall name dmz rule 400 destination port 22
set firewall name dmz rule 400 action accept

set firewall name dmz rule 500 protocol tcp
set firewall name dmz rule 500 destination port 80,443
set firewall name dmz rule 500 action accept


# dmz->int
set firewall name int rule 100 protocol icmp
set firewall name int rule 100 action accept

set firewall name int rule 50 state established enable
set firewall name int rule 50 state related enable
set firewall name int rule 50 action accept


set firewall name int rule 200 protocol tcp_udp
set firewall name int rule 200 destination port 123
set firewall name int rule 200 action accept


set firewall name int rule 300 protocol tcp_udp
set firewall name int rule 300 destination port 53
set firewall name int rule 300 action accept

set firewall name int rule 400 protocol tcp
set firewall name int rule 400 destination port 23
set firewall name int rule 400 action accept

set firewall name int rule 500 protocol tcp
set firewall name int rule 500 destination port 11000
set firewall name int rule 500 action accept

set firewall name int rule 600 protocol tcp
set firewall name int rule 600 destination port 13000
set firewall name int rule 600 action accept

commit

