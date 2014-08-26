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
}

  

