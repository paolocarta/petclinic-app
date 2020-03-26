# FROM registry.redhat.io/redhat-openjdk-18/openjdk18-openshift
FROM openjdk:8u242-jre-slim

COPY /target/spring-petclinic-*.jar /home/app.jar

CMD ["java","-jar","/home/app.jar"]
