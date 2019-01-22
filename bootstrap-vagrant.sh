#!/usr/bin/env bash

gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable

source /home/vagrant/.rvm/scripts/rvm

echo "source ~/.profile" >> ~/.bash_profile

source ~/.bash_profile

rvm install ruby-2.3.0

rvm ruby-2.3.0 do rvm gemset create medialog

rvm --default use 2.3.0@medialog

cd /vagrant

git clone https://github.com/NYU-ACM/medialog

cd medialog

gem install bundler

bundle config build.nokogiri --use-system-libraries

bundle install

cp /vagrant/database.yml /vagrant/medialog/config/

cp /vagrant/accounts.yml /vagrant/medialog/config/