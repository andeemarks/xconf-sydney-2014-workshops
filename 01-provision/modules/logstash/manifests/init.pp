class logstash{	

	include common

	

	$packages_dir = $common::packages_dir

	$package_name = 'logstash-1.4.2-1_2c0f5a1.noarch'
	$rpm_name = "logstash-1.4.2-1_2c0f5a1.noarch.rpm"
	$rpm_path = "${packages_dir}/${rpm_name}"

	package { 'java-1.6.0-openjdk': ensure => installed } -> 
	package { $package_name:
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
	}


	$elasticsearch_name = 'elasticsearch-1.1.1.noarch'
	$elasticsearch_rpm = "elasticsearch-1.1.1.noarch.rpm"
	$elasticsearch_path = "${packages_dir}/${elasticsearch_rpm}"

	package { 'elasticsearch-1.1.1.noarch':
		ensure => installed,
		provider => 'rpm',
		source => $elasticsearch_path,
	}	

}
