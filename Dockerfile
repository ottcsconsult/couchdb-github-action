FROM docker:stable
RUN apk add --no-cache curl
COPY entrypoint.sh /entrypoint.sh

COPY custom_couch/local.ini /local.ini
COPY custom_couch/vm.args /vm.args
COPY custom_couch/Dockerfile /Dockerfile
COPY custom_couch/etc /etc
COPY custom_couch/src /src
copy custom_couch/run-clouseau.sh /
copy custom_couch/docker-entrypoint.sh /

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]