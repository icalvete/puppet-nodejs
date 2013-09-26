class nodejs::config {

  file {$nodejs::params::nodejs_modules :
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0775'
  }
}
