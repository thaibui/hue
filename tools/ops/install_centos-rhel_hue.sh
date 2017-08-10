#!/bin/bash
set -e
mkdir -p /opt
git clone https://github.com/thaibui/hue.git /opt
cd /opt/hue
make apps
