#!/bin/bash
set -e
git clone https://github.com/thaibui/hue.git /opt
cd /opt/hue
make apps
