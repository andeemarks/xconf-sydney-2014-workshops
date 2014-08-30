class riemann::config {
  $host = $riemann::host
  $port = $riemann::port
  $config_file = $riemann::config_file
  $user = $riemann::user

  case $::osfamily {
    'Debian': {
      file { '/etc/init.d/riemann':
        ensure => link,
        target => '/lib/init/upstart-job',
      }

      file { '/etc/init/riemann.conf':
        ensure  => present,
        content => template('riemann/etc/init/riemann.conf.erb')
      }
    }
    'RedHat', 'Amazon': {
      file { '/etc/init.d/riemann':
        ensure  => present,
        mode    => '0755',
        content => template('riemann/etc/init/riemann.conf.redhat.erb')
      }
    }
    default: {}
  }

  file { '/var/lib/riemann-dash':
    ensure => directory,
    path   => '/var/lib/riemann-dash'
  } ->
  file { 'layout.json':
    ensure => present,
    path   => '/var/lib/riemann-dash/layout.json',
    source => 'puppet:///modules/riemann/etc/layout.json',
    owner  => $user
  }

  file { '/etc/riemann.sample.config':
    ensure => present,
    source => 'puppet:///modules/riemann/etc/riemann.config',
    owner  => $user,
  }
  file { '/etc/riemann-count-hosts.clj':
    ensure => present,
    source => 'puppet:///modules/riemann/etc/riemann-count-hosts.clj',
    owner  => $user,
  }
  file { '/etc/riemann-cpu-utilization-perc.clj':
    ensure => present,
    source => 'puppet:///modules/riemann/etc/riemann-cpu-utilization-perc.clj',
    owner  => $user,
  }

  file { '/etc/puppet/riemann.yaml':
    ensure  => present,
    content => template('riemann/etc/puppet/riemann.yaml.erb')
  }

  file { '/var/log/riemann.log':
    owner => $user,
  }


}
