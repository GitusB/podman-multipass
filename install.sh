#!/bin/bash
# script typicallay called by setup.sh to install packages
# 
#
############################################################
# check for homebrew and setup else bailout
  if [ -f /opt/homebrew/bin/brew ] ; then
        eval $(/opt/homebrew/bin/brew shellenv)
  else
    echo "Homebrew not found! check https://brew.sh "
    exit 1
  fi

#
PM_FOUND=$( brew list | grep podman )
MP_FOUND=$( brew list --cask | grep multipass )

if [ "$PM_FOUND" != "podman" ]; then
  echo "# Installing podman..."
  brew install podman
fi
if [ "$MP_FOUND" != "multipass" ]; then
  echo "# Installing multipass..."
  brew install --cask multipass
fi

