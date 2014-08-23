package { 'git': }

service { 'iptables':
	enable => false,
	ensure => stopped,
}

service { 'ip6tables':
	enable => false,
	ensure => stopped,
}

package { 'httpd': }

exec { '/bin/tar zxf /vagrant/binaries/go1.3.1.linux-amd64.tar.gz': 
	cwd => '/usr/local',
}

file { '/etc/profile.d/golang.sh':
	content => "export PATH=\"/usr/local/go/bin:\${PATH}\"",
	mode => 0644,
	owner => 'root',
	group => 'root',
}
