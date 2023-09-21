#! /bin/bash

lines=$1
filename=default_credit_hetero_guest
echo "copying file copy.sh to guest.."
scp copy.sh fate@192.168.0.12:
echo "copying ... to container"
ssh fate@192.168.0.12 docker cp /home/fate/copy.sh confs-9999-client-1:/
echo "executing the script inside docker and passing variables to the script"
ssh fate@192.168.0.12 docker exec  confs-9999-client-1 /copy.sh $lines $filename
echo "copying file upload_guest-template.json to upload_guest.json within the confs-9999-client-1 Docker container "
ssh fate@192.168.0.12 docker exec  confs-9999-client-1 cp fateflow/examples/upload/upload_guest-template.json fateflow/examples/upload/upload_guest.json
echo "command to replace occurrences of XXXX with a filename constructed from the variables filename and lines within the file located in the confs-9999-client-1 Docker container"
ssh fate@192.168.0.12 docker exec  confs-9999-client-1 sed -i "s/XXXX/$filename-$lines.csv/g" fateflow/examples/upload/upload_guest.json
echo "Uploading data of guest"
test=`ssh fate@192.168.0.12 docker exec confs-9999-client-1 flow data upload -c fateflow/examples/upload/upload_guest.json --drop`
echo "Submitting a job"
guest_submit_message=`ssh fate@192.168.0.12 docker exec confs-9999-client-1 flow job submit -d fateflow/examples/lr/test_hetero_lr_job_dsl.json -c fateflow/examples/lr/test_hetero_lr_job_conf.json`
echo "extract and compare the value of the retmsg field"
retmsg=`grep "retmsg" <<< $guest_submit_message| cut -d":" -f 2 | tr -d "\" " `
if [ $retmsg == "success" ]
then
echo "extracts the value of the model_version field from the variable guest_submit_message"
id=`grep "model_version" <<< $guest_submit_message| cut -d":" -f 2 | tr -d "\" " `
echo "ID=$id"
while [ `ssh fate@192.168.0.12 docker exec confs-9999-client-1 flow task query -r guest -j $id | grep -w f_status | grep -c "success"` != "7" ]
do
echo "WAITING for submit to complete.."
sleep 3
continue
done
echo "Training completed succefully.. Moving to next phase"

else
echo "FAILURE in model submit"
fi

#ssh fate@192.168.0.12 docker exec confs-9999-client-1 flow model deploy --model-id arbiter-10000#guest-9999#host-10000#model --model-version $id


#modelversion = 
#ssh fate@192.168.0.12 flow task query -r guest -j $modelversion | grep -w f_status



