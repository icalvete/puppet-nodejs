class nodejs::params {

  $repo_location  = 'https://deb.nodesource.com/node_'
  $nodejs_modules = hiera('nodejs_modules', '/srv/node_modules')
}
