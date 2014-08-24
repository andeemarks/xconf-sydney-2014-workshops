class tw_collectd { 

  class { '::collectd' :
    purge        => true,
    recurse      => true,
    purge_config => true
  }

  collectd::plugin { 'syslog':
    order => '00'
  }
  collectd::plugin { 'cpu': 
    order => '20'
  }

  class { 'collectd::plugin::rrdtool':
    order             => '30',
    datadir           => '/var/lib/collectd/rrd',
    createfilesasync  => false,
    rrarows           => 1200,
    rratimespan       => [3600, 86400, 604800, 2678400, 31622400],
    xff               => 0.1,
    cacheflush        => 900,
    cachetimeout      => 120,
    writespersecond   => 50

  }

  package { ['collectd-apache', 'collectd-rrdtool', 'stress'] :
    ensure  => present
  }

} 
