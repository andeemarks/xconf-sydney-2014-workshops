class common {
	$packages_dir = '/root/packages'

	file { $packages_dir:
		ensure => directory,
		mode => 0700,
		owner => 'root',
		group => 'root',
	}
}