class nodejs::install {

  apt::source { "nodejs_${nodejs::version}":
    comment  => 'This is the nodejs 5 mirror',
    location => "${nodejs::params::repo_location}${nodejs::version}.x",
    repos    => 'main',
    key      => {
      'id'     => '1655A0AB68576280',
      'server' => 'subkeys.pgp.net',
    },
    include  => {
      'src'    => true,
      'deb'    => true,
    },
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
