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


case "$(uname)" in 

  Linux)
    setup_ubuntu 
    ;;
  *)
    echo "Not Implemented for $(uname)"
    ;;
esac

ansible-playbook --ask-become-pass desktop-playbook.yml
