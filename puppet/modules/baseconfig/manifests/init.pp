class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  package { ['lxc', 'tree']:
    ensure => present;
  }

  service { "lxc":
    ensure => running,
    enable => true,
    require => Package['lxc'];
  }
  
  group { "lxd": ensure => present, }

}
