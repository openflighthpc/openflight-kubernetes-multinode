#!/bin/bash

ansible-playbook -i $INVFILE --extra-vars="cluster_name=$CLUSTERNAME  nfs_server=$NFS_SERVER default_username=$DEFAULT_USERNAME default_user_password=$DEFAULT_PASSWORD access_host=$ACCESS_HOST compute_ip_range=$COMPUTE_IP_RANGE hunter_hosts=$HUNTER_HOSTS" --tags pre $RUN_ENV/openflight-kubernetes-multinode/main.yml
