#!/usr/bin/env bash

yum remove -y postgresql postgresql-libs postgresql-devel

yum install -y devtoolset-7 llvm-toolset-7 libpq

yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

yum install -y postgresql14-server postgresql14-devel postgresql14-contrib