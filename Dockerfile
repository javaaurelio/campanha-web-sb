FROM openjdk:17-jdk-alpine
MAINTAINER javaaurelio
COPY target/spring-boot-first-web-application-0.0.1-SNAPSHOT.war app-web.war
ENTRYPOINT ["java","-jar","/app-web.war"]