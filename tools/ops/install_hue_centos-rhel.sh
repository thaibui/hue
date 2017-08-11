#!/bin/bash
set -e
if [ ! -d "/opt/hue" ]; then
    git clone https://github.com/thaibui/hue.git /opt/hue
fi
cd /opt/hue
git pull
make apps
