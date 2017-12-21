#!/bin/bash
set -e
if [ ! -d "/opt/hue-portal" ]; then
    git clone https://github.com/thaibui/hue.git /opt/hue-portal
    git checkout hue-portal-old-vpc
fi
cd /opt/hue-portal
git pull
make apps

# activate hue python environment
source build/env/bin/activate

# install Hue specific database driver / python libraries
pip install psycopg2

# sync database with external rdbms
hue syncdb --noinput
hue migrate

# deactivate the python environment
deactivate
