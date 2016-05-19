#!/usr/bin/env bash

yum install -y git gpg puppet ruby-devel libxml2-devel libxslt-devel postgresql-devel postgresql-contrib zlib-devel gcc-c++

firewall-cmd --zone public --add-port 3000/tcp --permanent

systemctl restart firewalld

puppet module install puppetlabs-postgresql
