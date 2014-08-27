class common {
  $packages_dir = '/vagrant/binaries'

  exec { '/vagrant/binaries/download.sh':
    umask => 0022,
  }

  package { ['avahi', 'avahi-tools', 'nss-mdns']:
    ensure => installed
  }
  ->
  service { ['avahi-daemon']:
    enable => true,
    ensure => running
  }

  service { ['iptables', 'ip6tables']:
    enable => false,
    ensure => stopped,
  }

  package { 'epel-release-6-8':
    ensure => present,
    provider => 'rpm',
    source => 'http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
  }->
  package { 'libyaml':
    ensure => present,
  }
}
