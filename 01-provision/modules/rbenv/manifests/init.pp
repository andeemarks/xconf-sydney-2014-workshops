class rbenv inherits rbenv::params {

  $app_dir = $rbenv::params::app_dir

  $setup_rbenv_sh = "${app_dir}/setup_rbenv.sh"

  include common::git

  file { $app_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
  }

  file { $setup_rbenv_sh:
    source  => 'puppet:///modules/rbenv/setup_rbenv.sh',
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    require => File[$app_dir],
  }

  group { 'rbenv':
    ensure => present,
  }->
  exec { 'Setup rbenv':
    command     => $setup_rbenv_sh,
    cwd         => $app_dir,
    user        => 'root',
    group       => 'root',
    unless      => "/bin/grep 'rbenv init' /etc/profile.d/rbenv.sh",
    require     => [ File[$setup_rbenv_sh], Class['common::git'] ],
  }

  common::ensure_user_in_group { 'Ensure vagrant user is in rbenv group':
    user => 'vagrant',
    group => 'rbenv',
    require => Group['rbenv'],
  }
}
