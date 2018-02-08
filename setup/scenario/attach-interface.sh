#!/bin/bash
# this script requires root privileges

virsh attach-interface --domain yoyodyne-nettester --type network --source nt_internal --model virtio --mac 00:00:5e:00:53:e1 --config
virsh attach-interface --domain yoyodyne-nettester --type network --source nt_dmz --model virtio --mac 00:00:5e:00:53:e2 --config
virsh attach-interface --domain tajimax-nettester --type network --source nt_internet --model virtio --mac 00:00:5e:00:53:e3 --config
virsh attach-interface --domain yoyodyne-vyos --type network --source vyos_internal --model virtio --mac 00:00:5e:00:53:e4 --config
virsh attach-interface --domain yoyodyne-vyos --type network --source vyos_dmz --model virtio --mac 00:00:5e:00:53:e5 --config
virsh attach-interface --domain yoyodyne-vyos --type network --source yo_global --model virtio --mac 00:00:5e:00:53:e6 --config
virsh attach-interface --domain global-vyos --type network --source vyos_internet --model virtio --mac 00:00:5e:00:53:e7 --config
virsh attach-interface --domain global-vyos --type network --source ta_global --model virtio --mac 00:00:5e:00:53:e8 --config

for vm in yoyodyne-nettester tajimax-nettester yoyodyne-vyos global-vyos ; do
    file=/etc/libvirt/qemu/${vm}.xml
    virsh define ${file}
    cp -p ${file} ${file}.tmp
    cat ${file} | sed -s "s/'network'/'direct'/g" | sed -s "s/network=/dev=/g" > ${file}.tmp
    cp -p ${file}.tmp ${file}
    virsh define ${file}
    cat ${file} | sed -s "s/'vepa'/'passthrough'/g" > ${file}.tmp
    cp -p ${file}.tmp ${file}
    rm -f ${file}
    virsh define ${file}
done
