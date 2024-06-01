#! /bin/bash

echo ""
echo "**********************************************"
echo "* DON'T CALL THIS SCRIPT WITH SUDO !!!       *"
echo "*                                            *"
echo "* BUT:                                       *"
echo "* A SUDO SESSION MUST BE ACTIVE FOR HOMEBREW *"
echo "* TO BE INSTALLED.                           *"
echo "*                                            *"
echo "* For example, start a sudo session with:    *"
echo "* sudo ls                                    *"
echo "*                                            *"
echo "**********************************************"
echo ""

me=$(basename $0)
dir=$(dirname -- "$( readlink -f -- "$0"; )")

brew="$(command -v brew)"
if [ -x "$brew" ]; then
  echo ""
  echo "$me: Hombrew is already installed: $brew"

  echo ""
  echo "$me: Update Hombrew ..."
  /opt/homebrew/bin/brew update
  # /usr/local/bin/brew update

  echo ""
  echo "$me: Upgrade outdated casks and outdated, unpinned formulae ..."
  /opt/homebrew/bin/brew upgrade
  # /usr/local/bin/brew upgrade

  echo ""
  echo "$me: Run Ansible playbook ..."
  /bin/bash -c "ansible-playbook -v $dir/playbook.yaml"
else
  echo ""
  echo "$me: Install Homebrew ..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew="$(command -v brew)"
  if [ -x "$brew" ]; then
    echo ""
    echo "$me: Homebrew was successfully installed!"

    echo ""
    echo "$me: Opt out of Hombrew analytics ..."
    # /usr/local/bin/brew analytics off
    # echo "$(/usr/local/bin/brew analytics)"
    /opt/homebrew/bin/brew analytics off
    echo "$(/opt/homebrew/bin/brew analytics)"

    echo ""
    echo "$me: Install Ansible ..."
    /opt/homebrew/bin/brew install ansible
    # /usr/local/bin/brew install ansible

    echo ""
    echo "$me: Run Ansible playbook ..."
    /bin/bash -c "ansible-playbook -v $dir/playbook.yaml"

  fi
fi

# Uninstall Homebrew:
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
