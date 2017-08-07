FROM centos:6

# mount current directory as the 'hue' working directory
ADD . /projects/hue
WORKDIR /projects/hue

# add epel extra repo for install apache-maven in centos6
RUN curl https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo | \
    sed 's/$releasever/6/g' > /etc/yum.repos.d/epel-apache-maven.repo

# install all hue required dependencies for centos6
RUN yum -y install ant asciidoc cyrus-sasl-devel cyrus-sasl-gssapi \
    cyrus-sasl-plain gcc gcc-c++ krb5-devel libffi-devel libxml2-devel \
    libxslt-devel make mysql mysql-devel openldap-devel \
    python-devel sqlite-devel gmp-devel openssl-devel apache-maven libtidy \
    java-1.8.0-openjdk \
    git

# build hue
RUN make apps

# run hue in local development mode, UI in port 8888
EXPOSE 8888
CMD ["build/env/bin/hue", "runserver", "0.0.0.0:8888"]
