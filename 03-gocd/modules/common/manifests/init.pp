class common {
	$packages_dir = '/vagrant/binaries'

	# exec { '/vagrant/binaries/download.sh': 
	# 	umask => 0022,
	# }

	service { ['iptables', 'ip6tables']:
		enable => false,
		ensure => stopped,
	}
}
