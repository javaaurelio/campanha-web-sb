FROM openjdk:17-jdk-alpine
MAINTAINER javaaurelio
COPY target/dashboard.web-0.0.1-SNAPSHOT.war app-web.war
ENTRYPOINT ["java","-jar","/app-web.war"]