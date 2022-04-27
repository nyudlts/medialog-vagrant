#!/usr/bin/env bash

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum update -y

yum install -y git nginx ruby-devel libxml2-devel libxslt-devel zlib-devel gcc-c++ centos-release-scl-rh postgresql-devel

echo "rails        3000/tcp" >> /etc/services

echo "nginx        80/tcp" >> /etc/services

systemctl enable firewalld

service start firewalld

firewall-cmd --zone public --add-port 3000/tcp --permanent

firewall-cmd --zone public --add-port 80/tcp --permanent

firewall-cmd --reload

iptables-save

setsebool -P httpd_can_network_connect 1

sudo cp /vagrant/nginx.conf /etc/nginx/nginx.conf

sudo cp /vagrant/medialog.conf /etc/nginx/conf.d/medialog.conf

sudo cp /vagrant/medialog.service /usr/lib/systemd/system/medialog.service

sudo mkdir /var/www

sudo chown -R vagrant:vagrant /var/www

systemctl enable nginx

systemctl enable medialog
