## This repository is used to test the Intent GBP Renderer Project

### Reference
This repository was used to create the images:
https://github.com/illotum/vagrant-mininet

#### Configuration
Before running the famous vagrant up, lets configure the settings for the Virtual Machines. Edit scripts/set_env_vars.sh and replace the values there with the values you plan on using.

### Usage
Please refer to: https://wiki.opendaylight.org/view/Network_Intent_Composition:GBP_Renderer_How_To
for more details.

Assuming everything was configured correctly, simply run:
```
vagrant up
```

On both virtual machines.

In case you made changes after the vragrant provisioning, simply reload the VMs:
```
vagrant reload --provion
```