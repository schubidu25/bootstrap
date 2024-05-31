#! /bin/bash

me=$(basename $0)

echo "$me: Create bootstrap directory ..."
bootstrap_dir="$HOME/.bootstrap"
mkdir -p "$bootstrap_dir" || exit 1

echo "$me: Clone bootstrap repo into $bootstrap ..."
git clone https://github.com/schubidu25/bootstrap.git "$bootstrap_dir" 

echo "$me: Execute bootstrap script"
/bin/bash -c "$bootstrap_dir/bootstrap.sh"