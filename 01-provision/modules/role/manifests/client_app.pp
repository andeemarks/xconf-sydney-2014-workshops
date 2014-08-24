class role::client_app {
  include common
  include apache
  include tw_collectd
#  include ruby::v2

  Class['common']->Class['apache']
}
