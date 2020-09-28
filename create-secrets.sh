#!/bin/sh

echo -n "Enter root password: "
read MYSQL_ROOT_PASSWORD_READ
if [ "$MYSQL_ROOT_PASSWORD_READ" = "" ]; then
    echo "Password must not be an empty string"
    exit 0
fi

echo -n "You typed: $MYSQL_ROOT_PASSWORD_READ. Continue(N/y)? "
read RESPONSE

if [ "$RESPONSE" != "y" ]; then
    exit 0
fi

echo -n "Enter user password: "
read MYSQL_PASSWORD_READ
if [ "$MYSQL_PASSWORD_READ" = "" ]; then
    echo "Password must not be an empty string"
    exit 0
fi

echo -n "You typed: $MYSQL_PASSWORD_READ. Continue(N/y)? "
read RESPONSE
if [ "$RESPONSE" != "y" ]; then
    exit 0
fi

echo "Generating  k8s/secrets.yaml..."

MYSQL_ROOT_PASSWORD=`echo -n  $MYSQL_ROOT_PASSWORD_READ | base64`
MYSQL_PASSWORD=`echo -n $MYSQL_PASSWORD_READ | base64`

cp secrets-tmpl.yaml k8s/secrets.yaml

sed "s/MYSQL_ROOT_PASSWORD_REPLACE_ME/$MYSQL_ROOT_PASSWORD/" k8s/secrets.yaml > k8s/secrets-temp.yaml
mv k8s/secrets-temp.yaml k8s/secrets.yaml

sed "s/MYSQL_PASSWORD_REPLACE_ME/$MYSQL_PASSWORD/" k8s/secrets.yaml > k8s/secrets-temp.yaml
mv k8s/secrets-temp.yaml k8s/secrets.yaml