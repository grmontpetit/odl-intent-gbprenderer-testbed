## This repository is used to test the Intent GBP Renderer Project

### Reference
This repository was used to create the image:
https://github.com/illotum/vagrant-mininet

#### Configuration
Before running the famous vagrant up, lets configure the settings for the Virtual Machines. Edit env.yaml to reflect your development setup.

### Usage
Please refer to: https://wiki.opendaylight.org/view/Network_Intent_Composition:GBP_Renderer_How_To
for more details.

Assuming everything was configured correctly, simply run:
```
vagrant up
```

In case you made changes after the vragrant provisioning, simply reload the VMs:
```
vagrant reload --provion
```

SSH to a machine:
```
vagrant ssh s1
vagrant ssh s2
```

The machines should also be accessible via your network.