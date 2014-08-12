class jdk7 {
	include common

	$packages_dir = $common::packages_dir

	$rpm_name = 'jdk-7u67-linux-x64.rpm'
	$rpm_path = "${packages_dir}/${rpm_name}"

	package { 'jdk7':
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
	}

}