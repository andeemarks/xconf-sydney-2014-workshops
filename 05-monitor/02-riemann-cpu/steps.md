# Enable collectd riemann client write_riemann

> sudo vi /opt/collectd/etc/collectd.conf

# Filter out streams on riemann

These are the sample events:

> {:host "zdehghan-web-service", :service "cpu-0/cpu-softirq", :state nil, :description nil, :metric 444, :tags nil, :time 1409056709, :ttl 20.0, :ds_index "0", :ds_name "value", :ds_type "derive", :type_instance "softirq", :type "cpu", :plugin_instance "0", :plugin "cpu"}

> {:host "zdehghan-web-service", :service "cpu-0/cpu-steal", :state nil, :description nil, :metric 0, :tags nil, :time 1409056709, :ttl 20.0, :ds_index "0", :ds_name "value", :ds_type "derive", :type_instance "steal", :type "cpu", :plugin_instance "0", :plugin "cpu"}

# 
