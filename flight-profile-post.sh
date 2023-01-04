#!/bin/bash

ansible-playbook -i $INVFILE --extra-vars="cluster_name=$CLUSTERNAME default_username=$DEFAULT_USERNAME compute_ip_range=$COMPUTE_IP_RANGE hunter_hosts=$HUNTER_HOSTS" --tags update $RUN_ENV/openflight-kubernetes-multinode/main.yml
