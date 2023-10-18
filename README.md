# VPC-Networking-and-Google-Compute-Engine
Introduction to VPC-Networking-and-Google-Compute-Engine

# Google Cloud Platform (GCP) Network Setup

This repository contains a Bash script that demonstrates setting up a Google Cloud Platform (GCP) network, creating VM instances, configuring firewall rules, and performing basic networking tasks. The script is designed to be run in a GCP Cloud Shell or on a local machine with the Google Cloud SDK (gcloud) installed.

## Prerequisites

- [Google Cloud SDK (gcloud)](https://cloud.google.com/sdk/docs/quickstarts)

## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/gcp-network-setup.git
   cd gcp-network-setup
   
2. Run the script
   
bash gcp_network_setup.sh

3. Follow the instructions and comments in the script to interactively create and manage your GCP network, VM instances, and firewall rules

4. Script Description
The Bash script gcp_network_setup.sh performs the following tasks:

Launch an interactive GCP Cloud Shell session.

View subnets in the default network.

List default routes.

List firewall rules.

Delete default firewall rules.

Delete the default network.

Attempt to create a VM instance without a network (to demonstrate that it will fail).

Create an auto-mode network named "mynetwork."

Create firewall rules for the "mynetwork" to allow SSH, RDP, custom, and ICMP traffic.

Create VM instances in the us-central1 and europe-central2 regions within the "mynetwork."

Run SSH into the "us-central1" VM instance.

Ping the internal and external IP addresses of the "europe-central2" VM instance.

Remove the "allow-icmp" firewall rule.

Run SSH into the "us-central1" VM instance again.
Ping the internal and external IP addresses of the "europe-central2" VM instance.
Remove the "allow-custom" firewall rule.
Run SSH into the "us-central1" VM instance again.
Ping the internal and external IP addresses of the "europe-central2" VM instance.
Remove the "allow-ssh" firewall rule.

