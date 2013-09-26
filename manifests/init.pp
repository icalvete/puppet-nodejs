class nodejs inherits nodejs::params {

  anchor {'nodejs::begin':
    before => Class['nodejs::install']
  }

  class {'nodejs::install':
    require => Anchor['nodejs::begin']
  }

  class {'nodejs::config':
    require => Class['nodejs::install']
  }

  anchor {'nodejs::end':
    require => Class['nodejs::config']
  }
}
