#!/bin/bash
# this script requires root privileges

for vm in global-vyos yoyodyne-vyos tajimax-nettester yoyodyne-nettester ; do
  virsh start $vm
done

# wait for starting api
while : ; do
  curl http://172.16.0.2:3000 1>/dev/null 2>&1
  if [[ "$?" -eq 0 ]] ; then
    break
  else
    printf "\rstarting NetTester APIs"
    for i in {1..10} ; do
      sleep 1
      printf "."
    done
    printf "\rstarting NetTester APIs          "
  fi
done
printf "\ndone\n"

