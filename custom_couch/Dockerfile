FROM couchdb:latest as stage-0

COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

FROM stage-0 as java
RUN apt-get update
RUN apt-get install -y wget apt-transport-https unzip

RUN mkdir -p /etc/apt/keyrings
RUN wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
RUN echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
RUN apt update 
RUN apt install temurin-8-jdk -y

FROM java as clouseau

ADD https://github.com/cloudant-labs/clouseau/releases/download/2.21.5/clouseau-2.21.5.zip /opt/clouseau/lib/clouseau-2.21.5.zip
RUN unzip -j /opt/clouseau/lib/clouseau-2.21.5.zip -d /opt/clouseau/lib && rm /opt/clouseau/lib/clouseau-2.21.5.zip
RUN mkdir /var/lib/clouseau

COPY ./etc /opt/clouseau/etc
COPY ./src/slf4j-simple-1.7.32.jar /opt/clouseau/lib
ENV CLASSPATH=/opt/clouseau/lib/*

FROM clouseau as entrypoint
ADD run-clouseau.sh /
ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /run-clouseau.sh
