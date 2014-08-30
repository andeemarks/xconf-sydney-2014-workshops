class role::client_app {
  include common
  include apache
  # include logstash_forwarder
  include tw_collectd
  # include ruby::v193

  Package['mailcap']->Package['epel-release-6-8']
  Class['common']->Class['tw_collectd']
}
