#!/bin/sh

openrc default
rc-service sshd start
ssh-keygen -A
rc-service sshd stop
# user=root
/usr/bin/supervisord -c /etc/supervisord.conf
