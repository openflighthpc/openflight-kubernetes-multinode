# OpenFlight Kubernetes (K8s) Multinode

## Overview

An Ansible playbook to configure a Multi Node Research Environment running Kubernetes and Flight User/Web Suite.

## Prereqs

The steps in `prepare.sh` have been performed on the system.

## Notes

This playbook _configures_ the services within it, it does not perform any installation. This is partnered with the Flight Solo image that can be found in the AWS Marketplace.

## Usage

- Login as root
- Clone repository
- Set variables
    - `cluster_name`: The name for this cluster to go by, it will appear in the command prompt and web suite
    - `default_username`: The default user on the system (e.g. on a Flight Solo image this will be `flight`), the Kubernetes Pod will be launched as this user 
    - `compute_ip_range`: The network range for the Kubernetes Pod
    - `hunter_hosts`: When set to true - this will make appropriate changes to `/etc/hosts` and system firewalls to trust hosts in [flight-hunter](https://github.com/openflighthpc/flight-hunter)
- Create ansible inventory file (e.g. `mycluster.inv`) that looks like the following
  ```shell
  [login]
  chead1

  [compute]
  cnode01
  cnode02
  ```
- Run the playbook 
  ```shell
  ansible-playbook -i mycluster.inv main.yml
  ```

