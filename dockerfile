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