#!/bin/bash

ansible-playbook -i $INVFILE --limit $NODE --extra-vars="cluster_name=$CLUSTERNAME default_username=$DEFAULT_USERNAME compute_ip_range=$COMPUTE_IP_RANGE hunter_hosts=$HUNTER_HOSTS" $RUN_ENV/openflight-slurm-multinode/main.yml
