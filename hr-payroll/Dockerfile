FROM openjdk:11
VOLUME /tmp
ADD ./target/hr-payroll-0.0.1.jar hr-payroll.jar
ENTRYPOINT ["java","-jar","/hr-payroll.jar"]