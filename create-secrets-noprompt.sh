#!/bin/sh

# Don't generate the secrets file if it already exists
if [ -f k8s/secrets.yaml ]; then
    exit 0
fi

# Workaround for not knowing how to pass these values from ansible
MYSQL_ROOT_PASSWORD_READ=notsosecret
MYSQL_PASSWORD_READ=pass

# MYSQL_ROOT_PASSWORD_READ=${MYSQL_ROOT_PASSWORD_READ:-}
# MYSQL_PASSWORD_READ=${MYSQL_PASSWORD_READ:-}

# if [ "$MYSQL_ROOT_PASSWORD_READ" = "" ] || [ "$MYSQL_PASSWORD_READ" = "" ]; then
#     echo "Error: Please set MYSQL_ROOT_PASSWORD_READ and MYSQL_PASSWORD_READ before running this script."
#     exit 1
# fi

echo "Generating  k8s/secrets.yaml..."

MYSQL_ROOT_PASSWORD=`echo -n  $MYSQL_ROOT_PASSWORD_READ | base64`
MYSQL_PASSWORD=`echo -n $MYSQL_PASSWORD_READ | base64`

cp secrets-tmpl.yaml k8s/secrets.yaml

sed "s/MYSQL_ROOT_PASSWORD_REPLACE_ME/$MYSQL_ROOT_PASSWORD/" k8s/secrets.yaml > k8s/secrets-temp.yaml
mv k8s/secrets-temp.yaml k8s/secrets.yaml

sed "s/MYSQL_PASSWORD_REPLACE_ME/$MYSQL_PASSWORD/" k8s/secrets.yaml > k8s/secrets-temp.yaml
mv k8s/secrets-temp.yaml k8s/secrets.yaml