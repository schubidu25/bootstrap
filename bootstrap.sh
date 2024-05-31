#! /bin/bash

echo ""
echo "**********************************************"
echo "* DANGER: DON'T CALL THIS SCRIPT WITH SUDO!  *"
echo "*                                            *"
echo "* BUT:                                       *"
echo "* A SUDO SESSION MUST BE ACTIVE FOR HOMEBREW *"
echo "* TO BE INSTALLED.                           *"
echo "**********************************************"
echo ""

me=$(basename $0)
dir=$(dirname -- "$( readlink -f -- "$0"; )")

brew="$(command -v brew)"
if [ -x "$brew" ]; then
  echo "$me: Hombrew is already installed: $brew"

  echo "$me: Update Hombrew ..."
  # /opt/homebrew/bin/brew update
  /usr/local/bin/brew update

  echo "$me: Upgrade outdated casks and outdated, unpinned formulae ..."
  # /opt/homebrew/bin/brew upgrade
  /usr/local/bin/brew upgrade
else
  echo "$me: Install Homebrew ..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew="$(command -v brew)"
  if [ -x "$brew" ]; then
    echo "$me: Homebrew was successfully installed!"

    echo "$me: Opt out of Hombrew analytics ..."
    # /opt/homebrew/bin/brew analytics off
    /usr/local/bin/brew analytics off
    # echo "$(/opt/homebrew/bin/brew analytics)"
    echo "$(/usr/local/bin/brew analytics)"

    echo "$me: Install Ansible ..."
    # /opt/homebrew/bin/brew install ansible
    /usr/local/bin/brew install ansible

    echo "$me: Run Ansible playbook ..."
    /bin/bash -c "ansible-playbook -v $dir/playbook.yaml"

  fi
fi

# Uninstall Homebrew:
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
