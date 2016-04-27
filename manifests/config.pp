class nodejs::config {

  file {$nodejs::params::nodejs_modules :
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0775'
  }

  exec { 'nodejs_legacy_link':
    command => '/bin/ln -s /usr/bin/nodejs /usr/bin/node',
    user    => 'root',
     unless => '/usr/bin/test -L /usr/bin/node'
  }
}
