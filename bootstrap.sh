#!/usr/bin/env bash

yum update -y

yum install -y git ruby-devel libxml2-devel libxslt-devel zlib-devel gcc-c++ postgresql-server postgresql-devel postgresql-contrib

yum update -y

echo "rails        3000/tcp" >> /etc/services

service firewalld enable

service firewalld start

firewall-cmd --zone public --add-port 3000/tcp --permanent

firewall-cmd --reload

iptables-save