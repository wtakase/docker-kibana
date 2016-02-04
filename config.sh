#!/bin/bash

sed -i -e "\$a kibana_elasticsearch_username: ${KIBANA_USER:=kibana}" \
       -e "\$a kibana_elasticsearch_password: ${KIBANA_PASSWORD:=kibana}" \
       /opt/kibana/config/kibana.yml

if [ -n "${ES_HOST_RESOLV}" ]; then
    echo ${ES_HOST_RESOLV} >> /etc/hosts
fi
