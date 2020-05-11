# Manjaro Linux system preparation

![CI](https://github.com/alxzoomer/manjaro-sysprep/workflows/CI/badge.svg)

## Goal

The goal of these Ansible playbooks is to build development environment from [Manjaro XFCE Minimal](https://manjaro.org/downloads/official/xfce/) Linux distributive on my laptop MSI GE-70 2PC.

## Prerequisites

* Installed Manjaro Linux XFCE

* Configured internet connection

* User with sudo access

* Pre-configured Ansible inventory hosts.yml file

## Install development environment with Ansible

### Bootstrap script

Use `bootstrap.sh` to prepare local ansible environment.

The bootstrap script will perform the following steps:

* Enable SSH service

* Install latest updates

* Install git, ansible, ansible-lint, yamllint, vim and yay (AUR package manager)

* Creates directory `~/projects` and clone this repo as `~/projects/manjaro-sysprep`

* Change current directory to `~/projects/manjaro-sysprep`

* Execute init make target

Execute bootstrap script:

```sh
source <(wget -O- https://raw.githubusercontent.com/alxzoomer/manjaro-sysprep/master/bootstrap.sh)
```

### Create hosts.yml

Create `hosts.yml` file from `hosts-example.yml`:

```sh
cp hosts-example.yml hosts.yml
```

Edit the `hosts.yml` and update the following options:

* `ansible_user` - set user name that will be main user in the system.

* `shadowsocks_config` settings if you want to configure shadowsocks socks 5 local proxy.

* `tigervnc_vncpass` - access password for TigerVNC service

* `i3lock_image_size` - to have correct walpaper and lock screen image size

* `i3_swap_l_alt_l_super` - set `true` if left <kbd>Alt</kbd> must be swapped with <kbd>Win</kbd> key. For my laptop it is preferred option because Win button placed right after <kbd>Space</kbd> button.

* `i3wm_bar` - set to `polybar` to have [polybar](https://github.com/polybar/polybar) bars instead of `i3status`. See more options inside [playbooks/roles/i3wm/defaults/main.yml](https://github.com/alxzoomer/manjaro-sysprep/blob/master/playbooks/roles/i3wm/defaults/main.yml) and Polybar [wiki](https://github.com/polybar/polybar/wiki) for modules configuration (at least battery, network).

## Run playbook

To show makefile help with all possible options run command:

```sh
make help
```

Run `all` target will execute most important playbooks:

```sh
make all
```
