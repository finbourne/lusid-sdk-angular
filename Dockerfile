FROM maven:3.5-jdk-10

RUN mkdir -p /usr/src/
WORKDIR /usr/src/

RUN apt-get update && \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_11.x  | bash - && \
    apt-get -y install nodejs && \
    npm install -g @angular/cli && \
    apt-get -y install jq

RUN wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.4.2/swagger-codegen-cli-2.4.2.jar -O swagger-codegen-cli.jar

ADD generate.sh .
ADD config.json .
ADD .swagger-codegen-ignore .
ADD angular.json .

ENTRYPOINT [ "/bin/bash", "generate.sh" ]