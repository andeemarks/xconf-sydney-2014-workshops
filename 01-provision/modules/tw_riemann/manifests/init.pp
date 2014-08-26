class tw_riemann { 

  class { '::riemann' : 
    host  =>  '0.0.0.0'
  } ->
  class { '::riemann::dash' :
  } ->
  class { '::riemann::tools' :
  }
}

  

