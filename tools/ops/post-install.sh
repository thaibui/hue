#!/usr/bin/env bash

set -o errexit

cp /opt/hue/tools/ops/hued /etc/init.d/

chkconfig --add hued

# Add log dir
mkdir -p /var/log/hue
chown -R hue:hue /var/log/hue

# Add directory for pidfile
mkdir -p /var/run/hue
chown -R hue:hue /var/run/hue
