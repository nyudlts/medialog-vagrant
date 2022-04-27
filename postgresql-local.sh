

/usr/pgsql-14/bin/postgresql-14-setup initdb

sudo rm /var/lib/pgsql/14/data/pg_hba.conf

cp /vagrant/pg_hba.conf /var/lib/pgsql/14/data/pg_hba.conf

systemctl enable postgresql-14

systemctl start postgresql-14

su - postgres -c "/usr/pgsql-14/bin/psql -c \"CREATE USER medialog superuser login password 'medialog';\""
su - postgres -c "/usr/pgsql-14/bin/psql -c \"CREATE DATABASE medialog owner medialog;\""
su - postgres -c "/usr/pgsql-14/bin/psql -c \"CREATE DATABASE medialogtest owner medialog;\""
su - postgres -c "/usr/pgsql-14/bin/psql -c \"CREATE DATABASE medialogdev owner medialog;\""
su - postgres -c "/usr/pgsql-14/bin/psql medialogdev < /vagrant/medialog.sql"