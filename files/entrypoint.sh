#!/bin/bash

ssh-keygen -f ~/.ssh/id_rsa -q -P ""

cat /id_rsa.pub >> ~/.ssh/authorized_keys

sudo /etc/init.d/ssh start

exec "$@"
