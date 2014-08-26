class role::monitoring {
  include ruby::v2
  include common
  include tw_riemann

  Class['common']->Class['tw_riemann']
}
