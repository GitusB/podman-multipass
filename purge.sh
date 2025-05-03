#!/bin/bash
#
#
# kill all 
if [ -z "$1" ]; then
  echo "!! No multipass instance name given e.g $0 <NAME>"
  exit 1
else
  MP_NAME=$1
fi
##############
echo "*** WARNING: this will destroy multipass instance $MP_NAME and related podman connections ***"
read -r -t 60 -p "*** Do you want to proceed [Y/n]" YN
if [[ "$YN" != [Y]* ]] ; then
  echo "# Bye..."
  exit
fi

echo "*** Okay you said Yes but need to be sure :)"
echo "*** Press CTRL-C to abort ..... you have 60 seconds "
for a in {1..60}; do
  echo -n "."
  sleep 1
done
echo " *** Okay yu asked for it, here we go..."
echo "# removing podman connections..."
podman system connection remove $INSTANCE_NAME
echo "# stopping multipass MP..."
multipass stop $MP_NAME
echo "# deleting multipass MP..."
multipass delete $MP_NAME
#multipass purge