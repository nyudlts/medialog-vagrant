#!/usr/bin/env bash

yum install -y deltarpm

yum install -y git puppet ruby-devel libxml2-devel libxslt-devel zlib-devel gcc-c++ postgresql-server postgresql-contrib

systemctl enable postgresql

postgresql-setup initdb

systemctl start postgresql

firewall-cmd --zone public --add-port 3000/tcp --permanent

systemctl restart firewalld