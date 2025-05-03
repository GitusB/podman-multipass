#!/bin/bash
#
# Setup podman

if [ -z "$1" ]; then
  echo "MP name required. eg $0 <NAME> "
  exit 1
else
  MP_NAME=$1
fi

# Check for a self-generated key TODO: Generate? or not?
if [ -f ~/.local/share/containers/podman/machine/podman-machine ]; then
  MYKEY="~.local/share/containers/podman/machine/podman-machine"
else
  MYKEY="~/.ssh/id_rsa"
fi

# setup the connections for podman:
echo "# Setting up podmann connections to $MP_NAME"
IP=$(multipass info $MP_NAME | grep IPv4: | cut -d ':' -f2 | tr -ds ' ' '')
if [ "$PODMAN_MODE" == "root" ]; then
  podman system connection add $MP_NAME --identity $MYKEY ssh://root@${IP}/run/podman/podman.sock
else
  podman system connection add $MP_NAME --identity $MYKEY  ssh://ubuntu@${IP}/run/user/1000/podman/podman.sock
fi

# add to hosts
echo "# adding instance to hosts"
IP_CONFIG_EXISTS=$(cat /private/etc/hosts | grep -c "$IP")
if [[ $IP_CONFIG_EXISTS -eq 0 ]]; then
  echo "$IP $MP_NAME" | sudo tee -a /private/etc/hosts
fi

##############################
# show connections
podman system connection list