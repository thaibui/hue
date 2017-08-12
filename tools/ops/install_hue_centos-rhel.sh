#!/bin/bash
set -e
if [ ! -d "/opt/hue" ]; then
    git clone https://github.com/thaibui/hue.git /opt/hue
fi
cd /opt/hue
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