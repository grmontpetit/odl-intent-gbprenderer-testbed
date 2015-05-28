## This repository is used to test the Intent GBP Renderer Project

### Usage
Please refer to: https://wiki.opendaylight.org/view/Network_Intent_Composition:GBP_Renderer_How_To
for more details.

#### Change default ips
Replace IP1 and IP2 with the IP you'd want to use with the VMs. THese are going to be bridge connections so that you can SSH from any host on your local network.
```
"export GBPHOST1=IP1" >> ~/.profile
"export GBPHOST2=IP2" >> ~/.profile
```
