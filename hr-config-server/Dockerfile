FROM openjdk:11
VOLUME /tmp
EXPOSE 8888
ADD ./target/hr-config-server-0.0.1.jar hr-config-server.jar
RUN -P
ENTRYPOINT ["java","-jar","/hr-config-server.jar"]