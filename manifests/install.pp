class nodejs::install {

  package {'nodejs':
    ensure => 'present'
  }

  package {'npm':
    ensure => 'present'
  }
}
