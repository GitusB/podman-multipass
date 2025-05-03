#!/bin/bash
#
# crude script to get podman up and running using multipass VM
#
# TODO: more error checking
#
if [ -z "$1" ]; then
  echo "# No instance name specified!"
  echo "# using podman-machine ad name."
  MP_NAME="podman-machine"
else
  MP_NAME=$1
fi

# Install packages if missing
if [ -f ./install.sh ]; then
  ./install.sh 
fi

if [ -f ./multipass.sh ]; then
  ./multipass.sh $MP_NAME
fi

if [ -f ./ podman.sh ]; then
  ./podman.sh $MP_NAME
fi


