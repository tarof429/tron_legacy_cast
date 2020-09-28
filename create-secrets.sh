#!/bin/sh

MYSQL_ROOT_PASSWORD=`echo -n 'portal' | base64`
MYSQL_PASSWORD=`echo -n 'secret' | base64`

cp secrets-tmpl.yaml k8s/secrets.yaml

sed "s/MYSQL_ROOT_PASSWORD_REPLACE_ME/$MYSQL_ROOT_PASSWORD/" k8s/secrets.yaml > k8s/secrets-temp.yaml
mv k8s/secrets-temp.yaml k8s/secrets.yaml

sed "s/MYSQL_PASSWORD_REPLACE_ME/$MYSQL_PASSWORD/" k8s/secrets.yaml > k8s/secrets-temp.yaml
mv k8s/secrets-temp.yaml k8s/secrets.yaml