#!/bin/bash

#creating an interactive help command line
gcloud beta interactive

#view subnets in the default network
gcloud compute networks subnets list --network default

#default routes 
gcloud compute routes list --filter="network=default AND priority=1000"

#lists of firewall rules
gcloud compute firewall-rules list

#deletes all firewall rules
gcloud compute firewall-rules delete default-allow-icmp default-allow-internal default-allow-rdp default-allow-ssh

#delete network which delete routes
gcloud compute networks delete default

#testing if an instance can be created without networks
#instance will fail as it can not be created without a network
gcloud compute instances create instance-1 --network default

#creating an auto mode network
gcloud compute networks create mynetwork --subnet-mode=auto

#creating firewall rules for an auto mode network
gcloud compute firewall-rules create mynetwork-allow-ssh --network mynetwork --allow=tcp:22 --source-ranges="0.0.0.0/0"

gcloud compute firewall-rules create mynetwork-allow-rdp --network mynetwork --allow=tcp:3389 --source-ranges="0.0.0.0/0"

gcloud compute firewall-rules create mynetwork-allow-custom --network mynetwork --allow=tcp:80 --source-ranges="10.128.0.0/9"

gcloud compute firewall-rules create mynetwork-allow-icmp --network mynetwork --allow=tcp:443 --source-ranges="0.0.0.0/0"

#Create a VM instance in the us-central1 region
gcloud compute instances create mynet-us-vm --zone us-central1-c  --machine-type f1-micro --network mynetwork

#Create a VM instance in europe-central2 region
gcloud compute instances create mynet-eu-vm --zone europe-central2-a  --machine-type f1-micro --network mynetwork

#runinng ssh in the machine
gcloud compute ssh mynet-us-vm --zone=us-central1-c

ping -c 3 <Enter mynet-eu-vm internal IP here>

ping -c 3 <Enter mynet-eu-vms external IP here>

exit

#Remove the allow-icmp firewall rule
gcloud compute firewall-rules delete mynetwork-allow-icmp

gcloud compute ssh mynet-us-vm --zone=us-central1-c

ping -c 3 <Enter mynet-eu-vm internal IP here>

ping -c 3 <Enter mynet-eu-vms external IP here>

exit

#Remove the allow-custom firewall rule
gcloud compute firewall-rules delete mynetwork-allow-custom

gcloud compute ssh mynet-us-vm --zone=us-central1-c

ping -c 3 <Enter mynet-eu-vm internal IP here>

ping -c 3 <Enter mynet-eu-vm internal IP here>

exit

#Remove the allow-ssh firewall rule
gcloud compute firewall-rules delete mynetwork-allow-ssh

#Created by Umaru Emmanuel Isaac

