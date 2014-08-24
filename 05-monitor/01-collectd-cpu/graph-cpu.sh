#!/usr/bin/sh

HOST=`uname -n`

#-s 'end-115m' -e '1303070963' -w '445' -h '150' \
/usr/bin/rrdtool graph - -a PNG --full-size-mode \
	-w '1200' -h '800' \
	'-n' \
	'DEFAULT:0:Bitstream Vera Sans' \
	'-v' \
	'Jiffies' \
	'-r' \
	'-u' \
	'100' \
	'-t' \
	"$HOST/cpu-0/cpu" \
	"DEF:idle_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-idle.rrd:value:MIN" \
	"DEF:idle_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-idle.rrd:value:AVERAGE" \
	"DEF:idle_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-idle.rrd:value:MAX" \
	'CDEF:idle_nnl=idle_avg,UN,0,idle_avg,IF' \
	"DEF:wait_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-wait.rrd:value:MIN" \
	"DEF:wait_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-wait.rrd:value:AVERAGE" \
	"DEF:wait_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-wait.rrd:value:MAX" \
	"CDEF:wait_nnl=wait_avg,UN,0,wait_avg,IF" \
	"DEF:nice_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-nice.rrd:value:MIN" \
	"DEF:nice_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-nice.rrd:value:AVERAGE" \
	"DEF:nice_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-nice.rrd:value:MAX" \
	'CDEF:nice_nnl=nice_avg,UN,0,nice_avg,IF' \
	"DEF:user_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-user.rrd:value:MIN" \
	"DEF:user_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-user.rrd:value:AVERAGE" \
	"DEF:user_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-user.rrd:value:MAX" \
	'CDEF:user_nnl=user_avg,UN,0,user_avg,IF' \
	"DEF:system_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-system.rrd:value:MIN" \
	"DEF:system_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-system.rrd:value:AVERAGE" \
	"DEF:system_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-system.rrd:value:MAX" \
	'CDEF:system_nnl=system_avg,UN,0,system_avg,IF' \
	"DEF:softirq_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-softirq.rrd:value:MIN"\
	"DEF:softirq_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-softirq.rrd:value:AVERAGE"\
	"DEF:softirq_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-softirq.rrd:value:MAX" \
	'CDEF:softirq_nnl=softirq_avg,UN,0,softirq_avg,IF' \
	"DEF:interrupt_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-interrupt.rrd:value:MIN" \
	"DEF:interrupt_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-interrupt.rrd:value:AVERAGE" \
	"DEF:interrupt_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-interrupt.rrd:value:MAX" \
	'CDEF:interrupt_nnl=interrupt_avg,UN,0,interrupt_avg,IF' \
	"DEF:steal_min=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-steal.rrd:value:MIN" \
	"DEF:steal_avg=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-steal.rrd:value:AVERAGE" \
	"DEF:steal_max=/var/lib/collectd/rrd/$HOST/cpu-0/cpu-steal.rrd:value:MAX" \
	'CDEF:steal_nnl=steal_avg,UN,0,steal_avg,IF' \
	'CDEF:steal_stk=steal_nnl' \
	'CDEF:interrupt_stk=interrupt_nnl,steal_stk,+' \
	'CDEF:softirq_stk=softirq_nnl,interrupt_stk,+' \
	'CDEF:system_stk=system_nnl,softirq_stk,+' \
	'CDEF:user_stk=user_nnl,system_stk,+' \
	'CDEF:nice_stk=nice_nnl,user_stk,+' \
	'CDEF:wait_stk=wait_nnl,nice_stk,+' \
	'CDEF:idle_stk=idle_nnl,wait_stk,+' \
	'AREA:idle_stk#ffffff' \
	'LINE1:idle_stk#ffffff:idle     ' \
	'AREA:wait_stk#ffebbf' \
	'LINE1:wait_stk#ffb000:wait     ' \
	'AREA:nice_stk#bff7bf' \
	'LINE1:nice_stk#00e000:nice     ' \
	'AREA:user_stk#bfbfff' \
	'LINE1:user_stk#0000ff:user     ' \
	'AREA:system_stk#ffbfbf' \
	'LINE1:system_stk#ff0000:system   ' \
	'AREA:softirq_stk#ffbfff' \
	'LINE1:softirq_stk#ff00ff:softirq  ' \
	'AREA:interrupt_stk#e7bfe7' \
	'LINE1:interrupt_stk#a000a0:interrupt' \
	'AREA:steal_stk#bfbfbf' \
	'LINE1:steal_stk#000000:steal    '
