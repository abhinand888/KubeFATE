#! /bin/bash
#ssh fate@172.16.89.179 docker exec confs-10000-client-1 flow test toy --guest-party-id 10000 --host-party-id 9999

lines=$1
filename=default_credit_hetero_host
echo "copying file copy.sh to host.."
scp copy.sh fate@192.168.0.11:
echo "copying ... to container"
ssh fate@192.168.0.11 docker cp /home/fate/copy.sh confs-10000-client-1:/
echo "executing the script inside docker and passing variables to the script"
ssh fate@192.168.0.11 docker exec  confs-10000-client-1 /copy.sh $lines $filename
echo "copying file upload_host-template.json to upload_host.json within the confs-10000-client-1 Docker container "
ssh fate@192.168.0.11 docker exec  confs-10000-client-1 cp fateflow/examples/upload/upload_host-template.json fateflow/examples/upload/upload_host.json
echo "command to replace occurrences of XXXX with a filename constructed from the variables filename and lines within the file upload_host.json located in the confs-10000-client-1 Docker container"
ssh fate@192.168.0.11 docker exec  confs-10000-client-1 sed -i "s/XXXX/$filename-$lines.csv/g" fateflow/examples/upload/upload_host.json
 
echo "output of this command into a shell variable named test"
test=`ssh fate@192.168.0.11 docker exec confs-10000-client-1 flow data upload -c fateflow/examples/upload/upload_host.json --drop`
#ssh fate@192.168.0.11 docker exec flow data upload -c fateflow/examples/upload/upload_host.json
