class tw_collectd () { 

  $fqdnlookup   = true
  $interval     = 10
  $threads      = 5
  $timeout      = 2

  $collectd_dir     = '/opt/collectd/etc/collectd.d'
  $plugin_conf_dir  = $collectd_dir
  $config_file      = '/opt/collectd/etc/collectd.conf'
  $purge            = undef
  $purge_config     = true
  $recurse          = undef

  $riemann_port     = 5555
  $riemann_host     = "${uname}-monitoring.local"
  $protocol         = 'TCP'
  $store_rates      = false
  $always_append_ds = false

  package { ['libtool-ltdl', 'rrdtool-devel', 'protobuf-c-devel'] :
    ensure => present
  }->
  package { 'collectd':
    source    => '/vagrant/binaries/collectd-5.4.1.51-1.x86_64.rpm',
    provider  => rpm,
    ensure    => installed,
    before    => File['collectd.conf', 'collectd.d']
  }

  file { 'collectd.d':
    ensure  => directory,
    path    => $plugin_conf_dir,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    purge   => $purge,
    recurse => $recurse,
  }

  $conf_content = $purge_config ? {
    true    => template('tw_collectd/collectd.conf.erb'),
    default => undef,
  }

  file { 'collectd.conf':
    path    => $config_file,
    content => $conf_content,
    notify  => Service['collectd'],
  }

  service { 'collectd':
    ensure    => running,
    name      => 'collectd',
    enable    => true,
    require   => Package['collectd'],
  }

  package { ['stress'] :
    ensure  => present
  }

}

file { '/home/vagrant/graph-cpu.json':
  ensure => present,
  source => 'puppet:///modules/tw_collectd/files/graph-cu.sh',
}
