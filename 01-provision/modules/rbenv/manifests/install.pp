define rbenv::install(
  $ruby_version
) {

  include rbenv

  $app_dir        = $rbenv::params::app_dir
  $rbenv_root_dir = $rbenv::params::rbenv_root_dir
  $setup_ruby_sh  = "${app_dir}/setup_ruby-${ruby_version}.sh"

  $ruby_build_libs = ['gcc', 'gcc-c++', 'openssl-devel', 'readline', 'libyaml-devel', 'readline-devel', 'zlib', 'zlib-devel']

  package { $ruby_build_libs:
    ensure => present,
  }

  file { "Copy ruby ${ruby_version} script":
    path    => $setup_ruby_sh,
    ensure  => file,
    source  => 'puppet:///modules/rbenv/setup_ruby.sh',
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    require => File[$app_dir],
  }

  exec { "Execute ruby ${ruby_version} script":
    command     => $setup_ruby_sh,
    timeout     => 3600, # 1 hour
    cwd         => $app_dir,
    user        => 'root',
    group       => 'rbenv',
    environment => ["RUBY_VERSION=${ruby_version}"],
    unless      => "/bin/ls ${rbenv_root_dir}/versions/${ruby_version}",
    require     => [ File["Copy ruby ${ruby_version} script"], Package[$ruby_build_libs] ],
  }
}
