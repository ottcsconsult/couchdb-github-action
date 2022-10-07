#!/bin/sh

COUCHDB_VERSION=$1

cat > Dockerfile << EOF
FROM couchdb:latest

COPY local.ini /opt/couchdb/etc/local.ini
EOF

cat > local.ini << EOF
[chttpd]
authentication_handlers = {chttpd_auth, cookie_authentication_handler}, {chttpd_auth, proxy_authentication_handler}, {chttpd_auth, default_authentication_handler}

[chttpd_auth]
secret = a7a6a238bae74b55384e07aa865a9014
proxy_use_secret = true

[dreyfus]
name = clouseau@127.0.0.1

[admins]
admin=password
EOF

echo "Starting CouchDB..."
docker build -t appro-couchdb .
docker run --name appro-couchdb -p 5984:5984 -d appro-couchdb
docker ps

sleep 10
