#!/bin/bash
set -e

# Detect EC2 Host IP address
if [[ -n $CLUSTER_AWS_DETECTION ]]
  then
  export CLUSTER_PUBLIC_ADDRESS=$(curl --connect-timeout 10 --silent --fail http://169.254.169.254/latest/meta-data/local-ipv4)
fi

# Run confd to render config file(s)
confd -onetime -backend env

# Run application
exec "$@"