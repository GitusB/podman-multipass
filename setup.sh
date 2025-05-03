#!/bin/bash
#
# crude script to get podman up and running using multipass VM
#
# TODO: more error checking
#
if [ -z "$1" ]; then
  echo " * no instance name specified"
  exit 1
else
  MP_NAME="podman-machine"
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


