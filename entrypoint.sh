#!/bin/sh

COUCHDB_VERSION=$1

#cat > Dockerfile << EOF
#FROM couchdb:latest

#COPY local.ini /opt/couchdb/etc/local.ini
#EOF


echo "Starting CouchDB..."
#pwd
cp -r /tmp/couch/* .
# ls -lrta ./
docker build -t appro-couchdb .
docker run --name appro-couchdb -p 5984:5984 -d appro-couchdb
docker ps 

sleep 8
#docker ps
#docker logs `docker ps | awk '{ print $1 }' | head -n 2|tail -n 1`
#sleep 5
#docker ps

