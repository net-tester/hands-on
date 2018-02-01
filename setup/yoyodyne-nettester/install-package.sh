#!/bin/bash

sudo apt update
sudo apt install -y git ruby2.3 ruby2.3-dev rubygems-integration build-essential rake openvswitch-switch ethtool iproute2 libxml2-dev zlib1g-dev ntp ntpdate libsqlite3-dev curl
sudo gem install bundle
curl -sS https://raw.githubusercontent.com/net-tester/net-tester/develop/script/install.sh | sh

