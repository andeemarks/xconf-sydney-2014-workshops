class gocd::server {

	include common
	include jdk7

        $packages_dir = $common::packages_dir

	$version = '14.2.0-377'
	$package_name = "go-server-${version}"
	$binary_name = "${package_name}.noarch.rpm"
	$binary_path = "${packages_dir}/${binary_name}"

	package { $package_name:
		ensure => installed,
		provider => 'rpm',
		source => $binary_path,
	}

	file_line { 'Set JAVA_HOME for go server':
		path  => '/etc/default/go-server',
		line  => 'JAVA_HOME=/usr/java/default',
		match => '^JAVA_HOME=.*',
		require => Package[$package_name],
		notify => Service['go-server'],
	}

	service { 'go-server':
		enable => true,
		ensure => running,
		require => [
			Package[$package_name],
			Class['jdk7'],
			File_line['Set JAVA_HOME for go server'],
		],
	}
}
