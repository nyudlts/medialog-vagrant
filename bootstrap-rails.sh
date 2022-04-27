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

cd /var/www

git clone https://github.com/nyudlts/medialog

cd medialog

cp /vagrant/database-rds.yml /var/www/medialog/config/database.yml

bundle install

RAILS_ENV=production bundle exec rake assets:precompile

sed -i 's/panic/warning/g' /home/vagrant/.rvm/gems/ruby-2.3.0@medialog/gems/activerecord-4.0.2/lib/active_record/connection_adapters/postgresql_adapter.rb