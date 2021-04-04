#!/bin/sh
./mvnw clean package -DskipTests

docker build -t hr-eureka-server:v1 .

docker run -p 8761:8761 --name hr-eureka-server --network hr-payroll-net hr-eureka-server:v1
