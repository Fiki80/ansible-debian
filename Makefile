DIR = .
FILE = Dockerfile
IMAGE = fiki/ansible-debian
NAME = testbox
TAG = latest

.PHONY: build run rm


build:
	cp ~/.ssh/id_rsa.pub files
	docker build -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)	
	rm files/id_rsa.pub

run:
	docker run -dit --name $(NAME) --hostname $(NAME) $(IMAGE) /bin/bash

rm:
	docker stop $(NAME)
	docker rm $(NAME)
