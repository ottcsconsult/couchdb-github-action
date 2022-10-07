#!/bin/sh

COUCHDB_VERSION=$1

if [[ -z "$COUCHDB_VERSION" ]]; then
  echo "Missing CouchDB version in the [couchdb-version] input. Received value: $COUCHDB_VERSION"
  exit 2
fi

if [[ $COUCHDB_VERSION != "latest" && $COUCHDB_VERSION != "3.1.0" && $COUCHDB_VERSION != "3.1" && $COUCHDB_VERSION != "3" && $COUCHDB_VERSION != "3.0.1" && $COUCHDB_VERSION != "3.0" && $COUCHDB_VERSION != "2.3.1" && $COUCHDB_VERSION != "2.3" && $COUCHDB_VERSION != "2" ]]; then
  echo "$$COUCHDB_VERSION should be one of latest, 3.1.0, 3.1, 3, 3.0.1, 3.0, 2.3.1, 2.3 and 2"
  exit 2
fi

echo "Environments"
echo "- curl : $(which curl)"

echo "Starting CouchDB..."
docker run --name my-couchdb-app -p 5984:5984 -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -e COUCHDB_SECRET=123456 -d couchdb:$COUCHDB_VERSION
docker ps

# FIXME can't connect. reason is unknown.
sleep 10
