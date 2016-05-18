#!/usr/bin/env bash

yum install -y git gpg

firewall-cmd --zone public --add-port 3000/tcp --permanent

systemctl restart firewalld

yum install -y puppet ruby-devel libxml2-devel libxslt-devel postgresql-devel postgresql-contrib zlib-devel gcc-c++

puppet module install puppetlabs-postgresql