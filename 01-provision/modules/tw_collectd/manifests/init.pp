class tw_collectd { 

  package { ['rrdtool-devel', 'rrdtool'] :
    ensure  => present
  }

  class { '::collectd' :
    purge_config => true,
    version => present
  }

  collectd::plugin { 'collectd::plugin::syslog': }
  collectd::plugin { 'collectd::plugin::cpu': }

  class { 'collectd::plugin::rrdtool':
    datadir           => '/var/lib/collectd/rrd',
    createfilesasync  => false,
    rrarows           => 1200,
    rratimespan       => [3600, 86400, 604800, 2678400, 31622400],
    xff               => 0.1,
    cacheflush        => 900,
    cachetimeout      => 120,
    writespersecond   => 50
  }

} 
