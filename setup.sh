#!/bin/bash

set -euo pipefail

setup_ubuntu() {
  if command -v ansible; then
    return 0
  fi	  
  sudo apt update
  sudo apt install -y software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt install -y ansible 
}

setup_darwin() {
  if command -v ansible; then
    return 0
  fi
  # Python3 and Pip3 seems to get installed through
  # command line developer tools
  sudo pip3 install ansible
}

case "$(uname)" in 

  Linux)
    setup_ubuntu 
    ;;
  Darwin)
    setup_darwin
    ;;
  *)
    echo "Not Implemented for $(uname)"
    ;;
esac

ansible-playbook --ask-become-pass desktop-playbook.yml
