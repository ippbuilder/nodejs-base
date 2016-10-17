#!/bin/bash
set -e

if [[ "$1" == node ]] || [ "$1" == nodejs ]; 
then
  echo "Setting up Newrelic configs ..."
    if [ "${NEWRELIC_LICENSE}" != "**None**" ]
    then
      sed -i "s/newrelic.enabled = false/newrelic.enabled = true/g" /usr/local/etc/php/conf.d/newrelic.ini
      sed -i "s/NRKEY/"${NEWRELIC_LICENSE}"/g" /usr/local/etc/php/conf.d/newrelic.ini
      sed -i 's/NRNAME/"${NEWRELIC_APPNAME}"/g' /usr/local/etc/php/conf.d/newrelic.ini
      echo "Newrelic configs are set."
    else
      echo "No Newrelic license found! Task aborted."
    fi
  echo "Running NPM ..."
    npm start
fi

exec "$@"
