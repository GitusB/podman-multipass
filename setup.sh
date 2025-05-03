#!/bin/bash
#
# crude script to get podman up and running using multipass VM
#
# TODO: more error checking

# Install packages if missing
if [ -f ./install.sh ]; then
  ./install.sh
fi

if [ -f ./multipass.sh ]; then
  ./multipass.sh
fi

if [ -f ./ podman.sh ]; then
  ./podman.sh
fi


