
PLAYBOOKDIR=./playbooks
ANSIBLE_PLAYBOOK=`which ansible-playbook`
LIMIT=f1.hv

PROJECTNAME=$(shell basename "$(PWD)")

default: help

## sysprep: Instal base system packages
sysprep:
	@echo Run sysprep playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/sysprep.yml

## i3: Install i3 WM and deploy configuration
i3:
	@echo Run i3wm playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/i3wm.yml

## soft: Install applications
soft:
	@echo Run soft playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/soft.yml

## deploy-ssh: Deploy SSH public key and configure sudoers
deploy-ssh:
	@echo Deploy ssh keys
	@$(ANSIBLE_PLAYBOOK) --ask-pass -k -K -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/deploy-ssh.yml

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
