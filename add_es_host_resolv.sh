#!/bin/bash

if [ -n "${ES_HOST_RESOLV}" ]; then
    echo ${ES_HOST_RESOLV} >> /etc/hosts
fi
