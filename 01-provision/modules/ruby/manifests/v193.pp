class ruby::v193 {
  package { 'ruby-ioof':
    ensure => present,
    provider => 'rpm',
    source => 'file:///vagrant/binaries/ruby-1.9.3p484-2.el6.x86_64.rpm',
    require => Package['libyaml'],
  }->
  file { '/opt/ruby/ruby193/env.sh':
    source => 'puppet:///modules/ruby/ruby193env.sh',
    mode => 0644,
  }
}
