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

* Install git, ansible, ansible-lint, yamllint and yay (AUR package manager)

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
