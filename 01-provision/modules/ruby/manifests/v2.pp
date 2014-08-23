class ruby::v2 {
  package { 'epel-release-6-8':
    ensure => present,
    provider => 'rpm',
    source => 'http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
  }

  exec { '/usr/bin/yum groupinstall -y "Development Tools"':
    umask => 0022,
    user => 'root',
    group => 'root',
  }

  package { [
    'libxslt-devel',
    'libyaml-devel',
    'libxml2-devel',
    'gdbm-devel',
    'libffi-devel',
    'zlib-devel',
    'openssl-devel',
    'readline-devel',
    'libcurl-devel',
    'pcre-devel',
    'git',
    'memcached-devel',
    'valgrind-devel',
    'mysql-devel',
    'ImageMagick-devel',
    'ImageMagick'
  ]:
    ensure => present,
  }
}
