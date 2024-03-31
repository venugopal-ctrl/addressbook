<<<<<<< HEAD
FROM maven:3.8.4-openjdk-11-slim AS build-stage
WORKDIR /app
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package
#stage2:Production stage
FROM tomcat:8.5.78-jdk11-openjdk-slim
COPY --from=build-stage /app/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
=======
From tomcat:8.5.72-jdk8-openjdk-buster
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_VERSION 3.8.4


RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share && \
    mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    apt-get clean && \
     rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./pom.xml ./pom.xml
COPY ./src ./src

run mvn package

RUN rm -rf /usr/local/tomcat/webapps/*

RUN cp /app/target/addressbook.war /usr/local/tomcat/webapps/

Expose 8080

CMD ["catalina.sh", "run"]
>>>>>>> 0371f8fd7870bb80f5c735d46f4f1bbbc54d80c2
