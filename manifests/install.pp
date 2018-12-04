class nodejs::install {

  exec { 'install_node_gpg':
    command  => '/usr/bin/wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | /usr/bin/apt-key add -',
    provider => 'shell'
  }

  apt::source { "nodejs_${nodejs::version}":
    comment  => 'This is the nodejs 5 mirror',
    location => "${nodejs::params::repo_location}${nodejs::version}.x",
    repos    => 'main',
    key      => {
      'id'     => '9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280',
      'server' => 'keyserver.ubuntu.com',
    },
    include  => {
      'src'    => true,
      'deb'    => true,
    },
    require  => Exec['install_node_gpg'],
    notify   => Exec['nodejs_source_list']
  }

  exec { 'nodejs_source_list':
    command  => "apt-get update -o Dir::Etc::sourcelist='sources.list.d/nodejs_${nodejs::version}.list' -o Dir::Etc::sourceparts='-' -o APT::Get::List-Cleanup='0'",
    user     => 'root',
    provider => 'shell',
  }

  package {'nodejs':
    ensure  => 'present',
    require => Exec['nodejs_source_list']
  }
}
