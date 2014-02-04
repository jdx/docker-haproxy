#!/bin/sh
exec chpst -u haproxy /usr/local/sbin/haproxy -f /etc/haproxy/haproxy.cfg >>/var/log/haproxy.log 2>&1
