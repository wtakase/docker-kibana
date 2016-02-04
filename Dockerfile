FROM kibana:4.1
MAINTAINER wtakase <wataru.takase@kek.jp>

COPY add_es_host_resolv.sh /
RUN sed -i -e "s/^verify_ssl: true/verify_ssl: false/" \
           -e "\$a kibana_elasticsearch_username: ${KIBANA_USER:=kibana}" \
           -e "\$a kibana_elasticsearch_password: ${KIBANA_PASSWORD:=kibana}" \
           /opt/kibana/config/kibana.yml && \
    sed -i "s/maybeIndex === config.kibana.kibana_index/maybeIndex.lastIndexOf(config.kibana.kibana_index, 0) === 0/" /opt/kibana/src/lib/validateRequest.js && \
    sed -i "s/resp\[indexName\].mappings/resp[Object.keys(resp).filter(function(index) { return (index.lastIndexOf(indexName, 0) === 0); })[0]].mappings/" /opt/kibana/src/public/index.js && \
    sed -i "/^set -e/a /add_es_host_resolv.sh" /docker-entrypoint.sh
