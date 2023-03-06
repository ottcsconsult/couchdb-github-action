FROM docker:stable
RUN apk add --no-cache curl
COPY entrypoint.sh /entrypoint.sh

COPY custom_couch/local.ini /tmp/couch/local.ini
COPY custom_couch/vm.args /tmp/couch/vm.args
COPY custom_couch/Dockerfile /tmp/couch/Dockerfile
COPY custom_couch/etc /tmp/couch/etc2
COPY custom_couch/src /tmp/couch/src2
COPY custom_couch/run-clouseau.sh /tmp/couch/run-clouseau.sh
COPY custom_couch/docker-entrypoint.sh /tmp/couch/docker-entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
