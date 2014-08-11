class jdk7 {
	include common

	$packages_dir = $common::packages_dir

	$url = 'https://www.dropbox.com/s/ybvwo9r3r68fh0x/jdk-7u67-linux-x64.rpm'
	$rpm_name = 'jdk-7u67-linux-x64.rpm'
	$rpm_path = "${packages_dir}/${rpm_name}"

	wget::fetch { $url:
		destination => $rpm_path,
		timeout     => 0,
		verbose     => false,
		require		=> File[$packages_dir],
	}

	package { 'jdk7':
		ensure => installed,
		provider => 'rpm',
		source => $rpm_path,
		require => Wget::Fetch[$url],
	}

}