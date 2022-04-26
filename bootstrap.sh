#!/usr/bin/env bash

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum update -y

yum install -y git ruby-devel libxml2-devel libxslt-devel zlib-devel gcc-c++ centos-release-scl-rh postgresql-devel



echo "rails        3000/tcp" >> /etc/services

service firewalld enable

service firewalld start

firewall-cmd --zone public --add-port 3000/tcp --permanent

firewall-cmd --reload

iptables-save