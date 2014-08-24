class common {
	$packages_dir = '/vagrant/binaries'

	exec { '/vagrant/binaries/download.sh': 
		umask => 0022,
	}

  package { ['avahi', 'avahi-tools']:
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
}
