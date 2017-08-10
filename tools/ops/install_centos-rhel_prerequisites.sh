#!/bin/sh
# Assumtions
# 1. Java & Java Open JDK are already installed
# 2. Python and easy_install is installed

# Install Maven
MAVEN_VERSION=3.5.0
wget http://apache.mirrors.ionfish.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz
tar -xzvf /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz -C /opt
export PATH=/opt/apache-maven-$MAVEN_VERSION/bin:$PATH

# Install all required external packages including supervisor
sudo yum -y install ant asciidoc cyrus-sasl-devel cyrus-sasl-gssapi cyrus-sasl-plain gcc gcc-c++ \
    krb5-devel libffi-devel libxml2-devel libxslt-devel make mysql mysql-devel openldap-devel \
    python-devel sqlite-devel gmp-devel openssl-devel supervisor git

# Install supervisord for easy hue process management
easy_install supervisor
