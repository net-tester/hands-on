#!/bin/bash
# this script requires root privileges

apt update
apt install -y git ruby2.3 ruby2.3-dev rubygems-integration build-essential rake openvswitch-switch ethtool iproute2 libxml2-dev zlib1g-dev ntp ntpdate libsqlite3-dev
apt install -y dnsmasq netcat curl openssl
gem install bundle
curl -sS https://raw.githubusercontent.com/net-tester/net-tester/develop/script/install.sh | sh

