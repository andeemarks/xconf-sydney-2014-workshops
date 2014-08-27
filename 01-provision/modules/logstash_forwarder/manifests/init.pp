class logstash_forwarder {

	include common

	$packages_dir = $common::packages_dir

	$package_name = 'logstash-forwarder-0.3.1-1.x86_64'
	$rpm_name = "logstash-forwarder-0.3.1-1.x86_64.rpm"
	$rpm_path = "${packages_dir}/${rpm_name}"

	package { $package_name:
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
	}

}
