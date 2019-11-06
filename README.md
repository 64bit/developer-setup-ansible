# developer-setup-ansible
Setup Ubuntu 18.04.03 for Development using Ansible

## Setup

To play `desktop-playbook.yml` playbook run:

```
./setup.sh
```

## List of Ansible roles

| Role | Description | Configuration | 
| --- | --- | --- | 
| common-packages | Installes packages which doesn't require much configurations like `curl`, `tig` etc. | see [main.yml](./roles/common-packages/tasks/main.yml) |
| docker | Installs `docker`, `docker-compose`. Adds current user to `docker` group | |
| git | Installs `git`, and creates global `~/.gitconfig` file | `gitconfig` see [desktop-playbook.yml](./desktop-playbook.yml) |
| nvidia | Installs NVIDIA driver. Needs reboot. Also installs [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-docker/blob/master/README.md#nvidia-container-toolkit) | `driver_version` | 
| ssh | Generates keypair in `~/.ssh` directory. Installs `openssh-server` and `/etc/ssh/ssh_config` only allowing public key login and prevents password logins.|  see [sshd_config.j2](./roles/ssh/templates/sshd_config.j2) |
| vim | Installs `vim` and creates `~/.vimrc` | Configure [.vimrc](roles/vim/files/vimrc) |
| visual-studio-code | Installs lastest version |  |
| zsh | Installs `zsh` and `oh-my-zsh` | `ohmyzsh_theme` (string) and `ohmyzsh_plugins` (list) |  
| pip | Installs `pip` (`pip2`) and `pip3`. Also sets `PATH=$PATH:~/.local/bin` for pip packages in shell startup files  (if present) `~/.zshrc` and `~/.bashrc`, hence restart shell as needed to load new `PATH`  | `pip3_packages` (list) |
| virtual-machine-software | Installs `multipass` on Ubuntu | |
| golang | Installs `go` in `/usr/local/go` as described [golang install doc](https://golang.org/doc/install#install) | `version` (default = 1.13.4) |

## Running specific Role

Individual roles can be played by using tags with same name, for example to run only `nvidia`: 

```
ansible-playbook --ask-become-pass desktop-playbook.yml --tags nvidia
```