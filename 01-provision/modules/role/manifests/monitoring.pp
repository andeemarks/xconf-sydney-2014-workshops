class role::monitoring {
  include ruby::v2
  include common
  include tw_collectd
  include tw_riemann

  Class['common']->Class['tw_collectd']->Class['tw_riemann']
}
