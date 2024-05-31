#! /bin/bash

me=$(basename $0)
dir=$(dirname -- "$( readlink -f -- "$0"; )")

echo "$me: Run Ansible playbook ..."
/bin/bash -c "ansible-playbook -v $dir/playbook.yaml"