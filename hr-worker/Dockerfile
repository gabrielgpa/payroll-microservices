FROM openjdk:11
VOLUME /tmp
ADD ./target/hr-worker-0.0.1.jar hr-worker.jar
ENTRYPOINT ["java","-jar","/hr-worker.jar"]