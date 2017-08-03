#!/bin/sh
# Assumtions
# 1. Java & Java Open JDK are already installed

# Install Maven
MAVEN_VERSION=3.5.0
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
wget http://apache.mirrors.ionfish.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz
tar -xzvf /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz -C /opt
export PATH=/opt/apache-maven-$MAVEN_VERSION/bin:$PATH

# Install all required external packages
sudo yum -y install ant asciidoc cyrus-sasl-devel cyrus-sasl-gssapi cyrus-sasl-plain gcc gcc-c++ krb5-devel libffi-devel libxml2-devel libxslt-devel make mysql mysql-devel openldap-devel python-devel sqlite-devel gmp-devel openssl-devel
