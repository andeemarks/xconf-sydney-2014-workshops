== Checkout collectd installation on the guest machine

  * /etc/collectd.d/* configuration
  * /var/lib/collectd/rrd round robin database files

== Stress the system
  * stress --cpu 8

== Product a graph to check out what's being captured

  ../05-monitor/scripts/vagrant-scp.sh ../05-monitor/01-collectd-cpu/graph-cpu.sh vagrant@client-app:~

  on the target machine run
  sh graph-cpu.sh > graph-cpu.png

  ./05-monitor/scripts/vagrant-scp.sh vagrant@client-app:~/graph-cpu.png ../05-monitor/01-collectd-cpu/graph-cpu.png
  open ../05-monitor/01-collectd-cpu/graph-cpu.png


