# Lets stress the cpu on the target machine

>guest$ stress --cpu 8

# Check out collectd installation on the target machine

## running as a daemon

>guest$ sudo service collectd status

## collectd configuration

>guest$ ls /etc/collectd.d/*

## checkout round robin database holding cpu stats

> /var/lib/collectd/rrd round robin database files

## Lets checkout the data collected locally - a simple ugly graph

on the host run:
> 01-provision$ ../05-monitor/scripts/vagrant-scp.sh ../05-monitor/01-collectd-cpu/graph-cpu.sh vagrant@client-app:~

on the target machine run:
>~$ sh graph-cpu.sh > graph-cpu.png

on teh host run
>01-provision$ ./05-monitor/scripts/vagrant-scp.sh vagrant@client-app:~/graph-cpu.png ../05-monitor/01-collectd-cpu/graph-cpu.png

>01-provision$ open ../05-monitor/01-collectd-cpu/graph-cpu.png


