# FROM registry.redhat.io/redhat-openjdk-18/openjdk18-openshift
FROM maven:3.6.3-jdk-8-slim as builder

ADD . /build/
WORKDIR /build

RUN mvn verify

FROM openjdk:8u242-jre-slim 

COPY --from=builder /build/target/spring-petclinic-*.jar /home/app.jar

EXPOSE 8080

USER 1001

CMD ["java","-jar","/home/app.jar"]
