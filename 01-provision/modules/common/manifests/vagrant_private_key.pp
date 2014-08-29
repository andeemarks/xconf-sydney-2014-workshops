class common::vagrant_private_key {
  file { '/home/vagrant/.ssh':
    ensure => directory,
    owner => 'vagrant',
    group => 'vagrant',
    mode => 0700,
  }
  ->
  file { '/home/vagrant/.ssh/id_rsa':
    ensure => file,
    owner => 'vagrant',
    group => 'vagrant',
    mode => 0400,
    source => 'puppet:///modules/common/vagrant/id_rsa',
  }
  ->
  file { '/home/vagrant/.ssh/config':
    ensure => file,
    owner => 'vagrant',
    group => 'vagrant',
    mode => 0400,
    source => 'puppet:///modules/common/vagrant/config',
  }
}
