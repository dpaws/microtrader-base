#!/bin/bash
set -e

# Check environment
if [[ -n ${CLUSTER_PUBLIC_ADDRESS} ]]
  then
  cluster_public_host="-Dvertx.cluster.public.host=${CLUSTER_PUBLIC_ADDRESS}"
fi

# Start application
exec java -jar /app/app.jar -server -cluster -Dvertx.hazelcast.config=/app/conf/cluster.xml $cluster_public_host "$@"