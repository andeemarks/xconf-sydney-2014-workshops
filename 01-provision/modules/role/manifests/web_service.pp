class role::web_service {
  include common
  include tw_collectd

  Class['common']->Class['tw_collectd']
}
