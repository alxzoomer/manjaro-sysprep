
PLAYBOOKDIR=./playbooks
ANSIBLE_PLAYBOOK=`which ansible-playbook`
LIMIT ?=all

PROJECTNAME=$(shell basename "$(PWD)")
GITHUB_WORKSPACE ?=$(PWD)

## default: Run 'make' without parameters to show help and init local ansible
default: help init

## deploy-ssh: Deploy SSH public key and configure sudoers
deploy-ssh:
	@echo Deploy ssh keys
	@$(ANSIBLE_PLAYBOOK) --ask-pass -k -K -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/deploy-ssh.yml

## all: Run sysprep, fonts, i3, soft and docker
all: sysprep vpn-proxy fonts i3 soft docker

## sysprep: Install base system packages
sysprep:
	@echo Run sysprep playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/sysprep.yml

## vpn-proxy: Install VPN and proxy services
vpn-proxy:
	@echo Run sysprep playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/vpn-proxy.yml

## fonts: Install fonts
fonts:
	@echo Run fonts playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/fonts.yml

## i3: Install i3 WM and deploy configuration
i3:
	@echo Run i3wm playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/i3wm.yml

## soft: Install applications
soft:
	@echo Run soft playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/soft.yml

## docker: Install docker
docker:
	@echo Run docker playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/docker.yml

## vmware: Install vmware
vmware:
	@echo Run vmware playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/vmware.yml

## vmware: Install vmware
aur-commit:
	@echo Install soft from AUR by commit
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/aur_by_commit.yml

## lint: Lint playbooks
lint:
	@echo Run linters
	@ansible-lint --force-color **/*.yml
	@yamllint --format colored .

## init: Install required modules for local ansible
init:
	@echo Init tools
	@ansible-galaxy install kewlfft.aur

.PHONY: help
help: Makefile
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo
