class role::web_service {
  include ruby::v2
  include common
  include tw_collectd

  package { 'ruby-ioof':
    provider => 'rpm',
    source => '/vagrant/binaries/ruby-1.9.3p484-2.el6.x86_64.rpm',
  }

  Class['common']->Class['tw_collectd']
}
