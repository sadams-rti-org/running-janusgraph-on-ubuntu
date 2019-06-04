#!/bin/bash
#
# NOTE: THIS FILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

JANUS_PROPS="${JANUS_CONFIG_DIR}/janusgraph.properties"
GREMLIN_YAML="${JANUS_CONFIG_DIR}/gremlin-server.yaml"

# running as root user
if [ "$1" == 'janusgraph' ]; then
  # install gremlin-python engine, looks to need to be installed by root decided to let container run as root for this and to avoid persmission issues with bind mounts
  # maybe this could/should move to the docker build file
  ${JANUS_HOME}/bin/gremlin-server.sh -i org.apache.tinkerpop gremlin-python 3.3.3

  # setup config directory
  #mkdir -p ${JANUS_DATA_DIR} ${JANUS_CONFIG_DIR}
  #cp conf/gremlin-server/gremlin-server.yaml ${JANUS_CONFIG_DIR}
  #chown -R "$(id -u):$(id -g)" ${JANUS_DATA_DIR} ${JANUS_CONFIG_DIR}
  #chmod 700 ${JANUS_DATA_DIR} ${JANUS_CONFIG_DIR}
  #chmod -R 600 ${JANUS_CONFIG_DIR}/*

  # remove config from environment, we will explicitly copy prop files to where they need to be in docker build file

  # wait for storage
  if ! [ -z "${JANUS_STORAGE_TIMEOUT:-}" ]; then
    F=$(mktemp --suffix .groovy)
    echo "graph = JanusGraphFactory.open('${JANUS_CONFIG_DIR}/janusgraph.properties')" > $F
    timeout ${JANUS_STORAGE_TIMEOUT}s bash -c \
      "until bin/gremlin.sh -e $F > /dev/null 2>&1; do echo \"waiting for storage...\"; sleep 5; done"
  fi

  exec ${JANUS_HOME}/bin/gremlin-server.sh ${JANUS_CONFIG_DIR}/gremlin-server.yaml
fi

# override hosts for remote connections with Gremlin Console
if ! [ -z "${GREMLIN_REMOTE_HOSTS:-}" ]; then
  sed -i "s/hosts\s*:.*/hosts: [$GREMLIN_REMOTE_HOSTS]/" ${JANUS_HOME}/conf/remote.yaml
fi

exec "$@"
