Medialog-Vagrant
================

prequisites: virtualbox & vagrant

clone the repo: <br>
$ git clone https://github.com/dmnyu/medialog-vagrant

cd into the repo: <br>
$ cd medialog-vagrant

install and configure the VM: <br>
$ vagrant up

once this has completed, log into the VM: <br>
$ vagrant ssh

change to the location of the app: <br>
$ cd /vagrant/medialog

start the server: <br>
$ rails s

then open a browser to http://localhost:3100, you should be able to now log in with: admin@example.com/password
