class gocd::server {

	include common
	include jdk7

	$packages_dir = $common::packages_dir

	$version = '14.2.0-377'
	$rpm_name = "go-server-${version}.noarch.rpm"
	$rpm_path = "${packages_dir}/${rpm_name}"

	package { 'go-server':
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
	}

	service { 'go-server':
		enable => true,
		ensure => running,
		require => [ Package['go-server'], Class['jdk7'] ],
	}
}