Docker Kibana
====

Docker Kibana image for supporting multiple Kibana indices.

Usage
----

```bash
docker run -d -p 5601:5601 -e ELASTICSEARCH_URL=https://kibana.example.com/es -e ES_HOST_RESOLV="192.168.1.1 kibana.example.com kibana" -e KIBANA_USER=kibana -e KIBANA_PASSWORD=password wtakase/kibana:4.1
```
