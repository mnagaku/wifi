#!/bin/vbash

vyatta_sbin=/opt/vyatta/sbin

args=$*

. /etc/bash_completion

eval _vyatta_op_run $args
