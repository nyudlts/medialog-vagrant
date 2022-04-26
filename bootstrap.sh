#!/usr/bin/env bash

yum update -y

yum install -y git ruby-devel libxml2-devel libxslt-devel zlib-devel gcc-c++

yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

yum update -y

yum install -y postgresql14-server

echo "rails        3000/tcp" >> /etc/services

service firewalld enable

service firewalld start

firewall-cmd --zone public --add-port 3000/tcp --permanent

firewall-cmd --reload

iptables-save