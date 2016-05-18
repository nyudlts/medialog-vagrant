class { 'postgresql::server': }

postgresql::server::role{'vagrant':
  superuser     => true,
  login   =>  true,
  password_hash => 'vagrant'
 }

 postgresql::server::role{'medialog':
  superuser     => true,
  login   =>  true,
  password_hash => 'medialog'
 }

postgresql::server::db { 'vagrant':
  user     => 'vagrant',
  password => postgresql_password('vagrant', 'vagrant'),
}

postgresql::server::db { 'medialog':
  user     => 'medialog',
  password => postgresql_password('medialog', 'medialog'),
}

postgresql::server::db { 'medialog-dev':
  user     => 'medialog',
  password => postgresql_password('medialog', 'medialog'),
}

postgresql::server::db { 'medialog-test':
  user     => 'medialog',
  password => postgresql_password('medialog', 'medialog'),
}