#!/bin/bash
# this script requires root privileges

for vm in global-vyos yoyodyne-vyos tajimax-nettester yoyodyne-nettester ; do
  virsh start $vm
done
