DIR = .
FILE = Dockerfile
IMAGE = fiki/ansible-debian
NAME = testbox
TAG = latest

.PHONY: help build run rm


#--------------------------------------------------------------------------------------------------
# Default Target
#--------------------------------------------------------------------------------------------------

help:
	@echo "################################################################################"
	@echo "#                                                                              #"
	@echo "#    Debian Provisioning with Ansible                                          #"
	@echo "#                                                                              #"
	@echo "################################################################################"
	@echo
	@echo
	@echo "------------------------------------------------------------"
	@echo " Run tests in Docker"
	@echo "------------------------------------------------------------"
	@echo
	@echo "build                 Build the testing Docker image (happens automatically during tests)"
	@echo "run  	             Run the testing Docker image (happens automatically during tests)"

build:
	cp ~/.ssh/id_rsa.pub files
	docker build -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)	
	rm files/id_rsa.pub

run:
	docker run -dit --name $(NAME) --hostname $(NAME) $(IMAGE) /bin/bash

rm:
	docker stop $(NAME)
	docker rm $(NAME)
