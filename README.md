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
| nvidia | Installs NVIDIA driver. Needs reboot | `driver_version` | 
| ssh | Generates keypair in `~/.ssh` directory|  |
| vim | Installs `vim` and creates `~/.vimrc` | Configure [.vimrc](roles/vim/files/vimrc) |
| visual-studio-code | Installs lastest version |  |
| zsh | Installs `zsh` and `oh-my-zsh` | `ohmyzsh_theme` (string) and `ohmyzsh_plugins` (list) |  
