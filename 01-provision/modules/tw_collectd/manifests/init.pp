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
  $protocol         = 'UDP'
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

    

 # class { 'collectd::plugin::rrdtool':
 #   order             => '30',
 #   datadir           => '/var/lib/collectd/rrd',
 #   createfilesasync  => false,
 #   rrarows           => 1200,
 #   rratimespan       => [3600, 86400, 604800, 2678400, 31622400],
 #   xff               => 0.1,
 #   cacheflush        => 900,
 #   cachetimeout      => 120,
 #   writespersecond   => 50

 # }

 # # TODO zhamak: fix the host name when we have host->ip mapping
 # class { 'collectd::plugin::write_riemann':
 #   order        => '40',
 #   riemann_host => `whoami`-monitoring.local,
 #   riemann_port => 5555,
 # }

 # package { ['collectd-apache', 'collectd-rrdtool', 'stress'] :
 #   ensure  => present
 # }
