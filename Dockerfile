FROM maven:3.5-jdk-10

RUN mkdir -p /usr/swaggerjar/
WORKDIR /usr/swaggerjar/

RUN apt-get update && \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_11.x  | bash - && \
    apt-get -y install nodejs && \
    npm install -g @angular/cli && \
    apt-get -y install jq

RUN wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.4.8/swagger-codegen-cli-2.4.8.jar -O /usr/swaggerjar/swagger-codegen-cli.jar

ADD generate.sh .

ENTRYPOINT [ "/bin/bash", "generate.sh" ]