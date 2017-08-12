#!/usr/bin/env bash
set -e

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    --hue-dir)
    HUE_DIR="$2"
    shift # past argument
    ;;
    --master-hostname)
    MASTER="$2"
    shift # past argument
    ;;
    --ldap-server)
    LDAP_SERVER="$2"
    shift # past argument
    ;;
    --ldap-base-dn)
    LDAP_BASE_DN="$2"
    shift # past argument
    ;;
    --db-host)
    DB_HOST="$2"
    shift # past argument
    ;;
    --db-user)
    DB_USER="$2"
    shift # past argument
    ;;
    --db-password)
    DB_PASSWORD="$2"
    shift # past argument
    ;;
    *)
    echo "Unknown option $key"
    exit -1
    ;;
esac
shift
done

# Get hue install dir
if [ -z "$HUE_DIR" ]; then
    echo "Hue install dir not supplied. Default to /opt/hue"
    HUE_DIR=/opt/hue
fi

if [ -z "$MASTER" ]; then
    echo "Master hostname not supplied. Default to `hostname`"
    MASTER=`hostname`
fi

if [ -z "$LDAP_SERVER" ]; then
    echo "ldap server is required"
    exit -1
fi

if [ -z "$LDAP_BASE_DN" ]; then
    echo "ldap base dn is required"
    exit -1
fi

if [ -z "$DB_HOST" ]; then
    echo "db host is required"
    exit -1
fi

if [ -z "$DB_USER" ]; then
    echo "db user is required"
    exit -1
fi

if [ -z "$DB_PASSWORD" ]; then
    echo "db password is required"
    exit -1
fi

echo "Hue installed dir: $HUE_DIR"
echo "Master hostname: $MASTER"
echo "LDAP server: $LDAP_SERVER"
echo "LDAP base dn: $LDAP_BASE_DN"
echo "DB host: $DB_HOST"
echo "DB user: $DB_USER"
echo "DB password: *****"

echo "Configuring .. $HUE_DIR/desktop/conf/pseudo-distributed.ini"
cat $HUE_DIR/desktop/conf/pseudo-distributed.ini.ambari.tmpl | \
    sed "s/{{master}}/$MASTER/g" | \
    sed "s/{{ldap-server}}/$LDAP_SERVER/g" | \
    sed "s/{{ldap-base-dn}}/$LDAP_BASE_DN/g" | \
    sed "s/{{db-host}}/$DB_HOST/g" | \
    sed "s/{{db-user}}/$DB_USER/g" | \
    sed "s/{{db-password}}/$DB_PASSWORD/g" \
    > $HUE_DIR/desktop/conf/pseudo-distributed.ini
