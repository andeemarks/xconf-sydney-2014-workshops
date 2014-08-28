class gocd::agent {

  include common
  include jdk7
  include golang::devel
  include ruby::v193

  $packages_dir = $common::packages_dir

  $version = '14.2.0-377'
  $package_name = "go-agent-${version}"
  $binary_name = "${package_name}.noarch.rpm"
  $binary_path = "${packages_dir}/${binary_name}"
  $username = regsubst($hostname,'^(.*?)-.*', '\1')
  $go_server = "${username}-ci-server.local"

  package { $package_name:
    ensure => installed,
    provider => 'rpm',
    source => $binary_path,
  }

  file { "/etc/default/go-agent":
    ensure => present,
    content => template("gocd/go-agent.erb"),
    subscribe => Package[$package_name],
    require => Package[$package_name],
    notify => Service["go-agent"]
  }

  service { 'go-agent':
    enable => true,
    ensure => running,
    require => [
      Package[$package_name],
      Class['jdk7'],
      File["/etc/default/go-agent"],
    ],
  }

  package {"ruby-devel": }
  ->
  package { "fpm": provider => "gem" }
  package { "bundle": provider => "gem" }
  package { 'rpm-build': }

}
