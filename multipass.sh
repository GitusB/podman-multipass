#!/bin/bash
#
# Create a multipass vm with name podman_machine
#
# Chnge values here for different VM sizes
MP_NAME="podman-machine"
MP_CORE=2
MP_MEM="4G"
MP_DISK="40G"

# set the name
multipass set client.primary-name=$MP_NAME

# create and launch the multipass instane
multipass launch -c $MP_CORE -m $MP_MEM -d $MP_DISK -n $MP_NAME --cloud-init cloud-init
multipass exec $MP_NAME -- /home/ubuntu/setup-podman.sh


# Volume mounts 
echo "# Mounting local folders..."
multipass mount /Users $MP_NAME
multipass mount /Volumes $MP_NAME
multipass mount /private $MP_NAME
multipass mount /tmp $MP_NAME
multipass mount /var/folders $MP_NAME

# restart
echo "# Restarting instance"
multipass restart $MP_NAME

# show info
multipass info $MP_NAME

