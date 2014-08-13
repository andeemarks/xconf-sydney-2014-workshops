class common {
	$packages_dir = '/vagrant/binaries'

	service { ['iptables', 'ip6tables']:
		enable => false,
		ensure => stopped,
	}
}