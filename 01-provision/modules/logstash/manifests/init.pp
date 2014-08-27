class logstash{	

	include common

	package { 'java-1.6.0-openjdk': ensure => present }

	$packages_dir = $common::packages_dir

	$package_name = 'logstash-1.4.2-1_2c0f5a1.noarch'
	$rpm_name = "logstash-1.4.2-1_2c0f5a1.noarch.rpm"
	$rpm_path = "${packages_dir}/${rpm_name}"

	package { $package_name:
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
	}

}
