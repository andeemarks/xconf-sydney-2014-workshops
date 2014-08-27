class tw_riemann { 

  class { '::riemann' : 
    host  =>  '0.0.0.0',
    user => 'vagrant'
  } ->
  class { '::riemann::dash' :
    host => '0.0.0.0',
    user => 'vagrant' 
  }
 # ->
 # class { '::riemann::tools' :
 # }

  exec { 'install riemann-dash gem under ruby 1.9.3':
    path => ['/opt/ruby/ruby193/bin'],
    command => 'gem install riemann-dash',
    environment => [
      'GEM_HOME=/opt/ruby/ruby193/lib64/ruby/gems/1.9.1',
      'GEM_PATH=/opt/ruby/ruby193/lib64/ruby/gems/1.9.1',
      'LD_LIBRARY_PATH=/opt/ruby/ruby193/lib64',
    ],
    unless => 'gem list | /bin/grep -E "^riemann-dash "',
    require => [ Class['::riemann::dash'], Class['::ruby::v193'] ],
  }
}

  

