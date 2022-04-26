#!/usr/bin/env bash

curl -sSL https://rvm.io/mpapis.asc | gpg --import -

curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

\curl -sSL https://get.rvm.io | bash -s stable

source /home/vagrant/.rvm/scripts/rvm

echo "source ~/.profile" >> ~/.bash_profile

source ~/.bash_profile

rvm install ruby-2.3.0

rvm ruby-2.3.0 do rvm gemset create medialog

rvm --default use 2.3.0@medialog

gem update --system 3.2.3

gem install bundler:1.16.6

cd /vagrant

git clone https://github.com/nyudlts/medialog

cd medialog

cp /vagrant/database.yml /vagrant/medialog/config/

cp /vagrant/accounts.yml /vagrant/medialog/config/

sed -i 's/panic/warning/g' /home/vagrant/.rvm/gems/ruby-2.3.0@medialog/gems/activerecord-4.0.2/lib/active_record/connection_adapters/postgresql_adapter.rb

bundle install
