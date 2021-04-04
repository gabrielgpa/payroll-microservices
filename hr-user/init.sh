#!/bin/sh
./mvnw clean package -DskipTests

docker build -t hr-user:v1 .

docker run -P --network hr-payroll-net hr-user:v1
