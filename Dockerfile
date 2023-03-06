FROM docker:stable
RUN apk add --no-cache curl
COPY entrypoint.sh /entrypoint.sh

COPY custom_couch/local.ini /github/workspace/local.ini
COPY custom_couch/vm.args /github/workspace/vm.args
COPY custom_couch/Dockerfile /github/workspace/Dockerfile
COPY custom_couch/etc /github/workspace/etc2
COPY custom_couch/src /github/workspace/src2
COPY custom_couch/run-clouseau.sh /github/workspace/run-clouseau.sh
COPY custom_couch/docker-entrypoint.sh /github/workspace/docker-entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
