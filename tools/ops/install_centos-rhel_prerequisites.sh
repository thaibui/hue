#!/bin/sh
# Assumtions
# 1. Java & Java Open JDK are already installed
# 2. Python and easy_install is installed

# Install Maven
MAVEN_VERSION=3.5.0
wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz
tar -xzvf /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz -C /opt
export PATH=/opt/apache-maven-$MAVEN_VERSION/bin:$PATH

# Ambari metrics uses gcc64 which messes up Hue using gcc48, so we uninstall gcc64 (which include ambari metrics monitor)
# then install it back at the end.
# TODO just make an RPM for Hue already!
yum -y remove gcc64

# Install all required external packages including supervisor
yum -y install ant asciidoc cyrus-sasl-devel cyrus-sasl-gssapi cyrus-sasl-plain gcc gcc-c++ \
    krb5-devel libffi-devel libxml2-devel libxslt-devel make mysql mysql-devel openldap-devel \
    python-devel sqlite-devel gmp-devel openssl-devel postgresql-devel supervisor git jq \
    ambari-metrics-monitor

# Install supervisord for easy hue process management
easy_install supervisor
# Configure, require root access
export PATH=/usr/local/bin:$PATH
echo_supervisord_conf > /etc/supervisord.conf
