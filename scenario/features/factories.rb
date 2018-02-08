# frozen_string_literal: true

FactoryGirl.define do

  sequence :virtual_port_number, 2

  trait :internal_network_host do
    tester_set_name 'yoyodyne'
    netmask '255.255.255.0'
    gateway '10.10.10.254'
    virtual_port_number
  end

  factory :git_host, class: TestNode do
    name 'git_host'
    internal_network_host
    ip_address '10.10.10.1'
    physical_port_number 3
    vlan_id 2025
    mac_address '00:00:5E:00:53:01'
  end

  factory :test_host, class: TestNode do
    name 'test_host'
    internal_network_host
    ip_address '10.10.10.2'
    physical_port_number 3
    vlan_id 2025
    mac_address '00:00:5E:00:53:02'
  end

  factory :user_pc, class: TestNode do
    name 'user_pc'
    internal_network_host
    ip_address '10.10.10.4'
    physical_port_number 2
    vlan_id 2025
    mac_address '00:00:5E:00:53:03'
  end

  trait :dmz_network do
    tester_set_name 'yoyodyne'
    netmask '255.255.255.0'
    gateway '10.10.0.1'
    virtual_port_number
  end

  factory :dmz_host, class: TestNode do
    name 'dmz_host'
    dmz_network
    ip_address '10.10.0.100'
    physical_port_number 3
    vlan_id 2023
    mac_address '00:00:5E:00:53:04'
  end

  factory :dns_host, class: TestNode do
    name 'dns_host'
    dmz_network
    ip_address '10.10.0.10'
    physical_port_number 3
    vlan_id 2023
    mac_address '00:00:5E:00:53:05'
  end

  factory :vpn_host, class: TestNode do
    name 'vpn_host'
    dmz_network
    ip_address '10.10.0.11'
    physical_port_number 3
    vlan_id 2023
    mac_address '00:00:5E:00:53:06'
  end

  factory :vpn_address_pool, class: TestNode do
    name 'vpn_addrpool'
    dmz_network
    ip_address '10.10.0.130'
    physical_port_number 3
    vlan_id 2023
    mac_address '00:00:5E:00:53:07'
  end

  trait :internet_network do
    tester_set_name 'tajimax'
    netmask '255.255.255.0'
    gateway '198.51.100.254'
    virtual_port_number
  end

  factory :internet_pc, class: TestNode do
    name 'internet_pc'
    internet_network
    ip_address '198.51.100.1'
    physical_port_number 2
    mac_address '00:00:5E:00:53:08'
  end

  factory :internet_dns_host, class: TestNode do
    name 'internet_dns'
    internet_network
    ip_address '198.51.100.2'
    physical_port_number 2
    mac_address '00:00:5E:00:53:09'
  end

  factory :internet_host, class: TestNode do
    name 'internet_svr'
    internet_network
    ip_address '198.51.100.3'
    physical_port_number 2
    mac_address '00:00:5E:00:53:0A'
  end

  factory :internet_ntp_host, class: TestNode do
    name 'internet_ntp'
    internet_network
    ip_address '198.51.100.4'
    physical_port_number 2
    mac_address '00:00:5E:00:53:0B'
  end

  factory :tajimax_pc, class: TestNode do
    name 'tajimax_pc'
    internet_network
    ip_address '198.51.100.94'
    physical_port_number 2
    mac_address '00:00:5E:00:53:0C'
  end
end
