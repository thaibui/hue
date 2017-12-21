#!/usr/bin/env bash

set -o errexit

cp /opt/hue-portal/tools/ops/hued /etc/init.d/

chkconfig --add hue-portald

# Add log dir
mkdir -p /var/log/hue-portal
chown -R hue:hue /var/log/hue-portal

# Add directory for pidfile
mkdir -p /var/run/hue-portal
chown -R hue:hue /var/run/hue-portal

# Add hue permissions to hue working directory
chown -R hue:hue /opt/hue-portal
