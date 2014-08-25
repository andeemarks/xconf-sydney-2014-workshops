class jdk7 {
	include common

	$packages_dir = $common::packages_dir

	$package_name = 'jdk-1.7.0_67-fcs.x86_64'
	$rpm_name = "jdk-7u67-linux-x64.rpm"
	$rpm_path = "${packages_dir}/${rpm_name}"

	package { $package_name:
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
	}

}