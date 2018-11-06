cluster:
  name: ${CLUSTER_NAME:elasticsearch-default}

node:
  master: ${NODE_MASTER:true}
  data: ${NODE_DATA:true}
  name: ${NODE_NAME:true}
  ingest: ${NODE_INGEST:true}
  max_local_storage_nodes: ${MAX_LOCAL_STORAGE_NODES:1}

processors: ${PROCESSORS:1}

network.host: ${NETWORK_HOST:_site_}

path:
  data: /data/data
  logs: /data/log
  repo: ${REPO_LOCATIONS:""}

bootstrap:
  memory_lock: ${MEMORY_LOCK:false}

http:
  enabled: ${HTTP_ENABLE:true}
  compression: true
  cors:
    enabled: ${HTTP_CORS_ENABLE:true}
    allow-origin: ${HTTP_CORS_ALLOW_ORIGIN:*}

discovery:
  zen:
    ping.unicast.hosts: ${DISCOVERY_SERVICE:elasticsearch-discovery}
    minimum_master_nodes: ${NUMBER_OF_MASTERS:1}