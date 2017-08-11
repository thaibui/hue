#!/bin/bash
set -e

# Install Centos 6 prerequisites
source <(curl -s https://raw.githubusercontent.com/thaibui/hue/master/tools/ops/install_centos-rhel_prerequisites.sh?$RANDOM)

# Pre-install
source <(curl -s https://raw.githubusercontent.com/thaibui/hue/master/tools/ops/pre-install.sh?$RANDOM)

# Install
source <(curl -s https://raw.githubusercontent.com/thaibui/hue/master/tools/ops/install_hue_centos-rhel.sh?$RANDOM)

# Post-install
source <(curl -s https://raw.githubusercontent.com/thaibui/hue/master/tools/ops/post-install.sh?$RANDOM)
