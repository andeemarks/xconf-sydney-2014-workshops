class role::monitoring {
  include ruby::v193
  include common
  include tw_riemann

  Class['common']->Class['tw_riemann']
}
