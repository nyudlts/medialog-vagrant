#!/usr/bin/env bash

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum update -y

yum install -y git ruby-devel libxml2-devel libxslt-devel zlib-devel gcc-c++ centos-release-scl-rh postgresql-devel

yum install -y devtoolset-7 llvm-toolset-7

yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

yum install -y postgresql14-server postgresql14-devel postgresql14-contrib

/usr/pgsql-14/bin/postgresql-14-setup initdb

mv /vagrant/pg_hba.conf /var/lib/psql/14/data/pg_hba.conf

systemctl enable postgresql-14

systemctl start postgresql-14

echo "rails        3000/tcp" >> /etc/services

service firewalld enable

service firewalld start

firewall-cmd --zone public --add-port 3000/tcp --permanent

firewall-cmd --reload

iptables-save