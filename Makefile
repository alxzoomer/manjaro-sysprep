
PLAYBOOKDIR=./playbooks
ANSIBLE_PLAYBOOK=`which ansible-playbook`
LIMIT=f1.hv

sysprep:
	@echo Run sysprep playbook
	@$(ANSIBLE_PLAYBOOK) -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/sysprep.yml

deploy-ssh:
	@echo Deploy ssh keys
	@$(ANSIBLE_PLAYBOOK) --ask-pass -k -K -i hosts.yml -l $(LIMIT) $(PLAYBOOKDIR)/deploy-ssh.yml
