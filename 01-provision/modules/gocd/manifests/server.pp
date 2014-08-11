class gocd::server {

	include common
	include jdk7

	$packages_dir = $common::packages_dir

	$version = '14.2.0-377'
	$url = 'https://www.dropbox.com/s/egd1rkv8ub55foz/go-server-14.2.0-377.noarch.rpm'
	$rpm_name = "go-server-${version}.noarch.rpm"
	$rpm_path = "${packages_dir}/${rpm_name}"

	wget::fetch { $url:
		destination => $rpm_path,
		timeout     => 0,
		verbose     => false,
		require		=> File[$packages_dir],
	}

	package { 'go-server':
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
		require => Wget::Fetch[$url],
	}

	service { 'go-server':
		enable => true,
		ensure => running,
		require => [ Package['go-server'], Class['jdk7'] ],
	}
}