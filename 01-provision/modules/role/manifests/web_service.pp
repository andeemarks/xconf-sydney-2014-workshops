class role::web_service {
  # include ruby::v193
  include common
  include tw_collectd
  # include logstash_forwarder


  Class['common']->Class['tw_collectd']
}
