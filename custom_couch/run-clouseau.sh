#!/bin/bash
export ERTSPATH=`for PATH in /opt/couchdb/erts*/bin;do echo $PATH;done`
export PATH=$PATH:$ERTSPATH
printenv

#explicetly start local epmd since for scalang/clouseau there's no automatic launch mechanism like there is for erlang
epmd -daemon

java \
  -server \
  -Xmx2G \
  -Dsun.net.inetaddr.ttl=30 \
  -Dsun.net.inetaddr.negative.ttl=30 \
  -XX:OnOutOfMemoryError="kill -9 %p" \
  -XX:+UseConcMarkSweepGC \
  -XX:+CMSParallelRemarkEnabled \
  com.cloudant.clouseau.Main \
  /opt/clouseau/etc/clouseau.ini

