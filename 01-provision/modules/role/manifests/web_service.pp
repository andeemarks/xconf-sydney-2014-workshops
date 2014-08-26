class role::web_service {
  include ruby::v2
  include common
  include tw_collectd

  rbenv::install { '2.0.0-p481':
    ruby_version => '2.0.0-p481',
  }

  Class['common']->Class['tw_collectd']
}
