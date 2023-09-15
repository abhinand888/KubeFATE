#! /bin/bash
#ssh fate@172.16.89.179 docker exec confs-10000-client-1 flow test toy --guest-party-id 10000 --host-party-id 9999

echo "Starting testing with $1 items"
sleep 1
echo "Starting Host"
time ./host.sh $1
echo "Completed Host"
sleep 1
echo "Starting Guest"
time ./guest.sh $1
echo "Completed Guest"

