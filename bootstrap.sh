#! /bin/bash

me=$(basename $0)

brew="$(command -v brewx)"
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

    # echo "$me: Download Ansible playbook ...""
    echo "$me: Create Ansible playbook ..."

  fi
fi

# Uninstall Homebrew:
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
