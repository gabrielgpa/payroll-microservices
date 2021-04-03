FROM openjdk:11
VOLUME /tmp
EXPOSE 8761
ADD ./target/hr-eureka-server-0.0.1.jar hr-eureka-server.jar
ENTRYPOINT ["java","-jar","/hr-eureka-server.jar"]