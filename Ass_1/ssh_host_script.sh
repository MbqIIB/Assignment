#!/bin/bash

#List of Hosts IP's
HOST=172.9.0.1,172.9.0.2,172.9.0.3


for h in $(echo $HOST | sed "s/,//g")
do
echo -e "Hostname = $h"
read -p "Enter the Command to get its output:" input
#SSH to each host IP assuming password less connectivity i.e, using key-exchanged"
ssh $h $input
done