class role::web_service {
  include ruby::v2
  include common
  include tw_collectd

  Class['common']->Class['tw_collectd']
}
