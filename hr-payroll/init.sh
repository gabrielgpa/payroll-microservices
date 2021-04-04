#!/bin/sh
./mvnw clean package -DskipTests

docker build -t hr-payroll:v1 .

docker run -P --network hr-payroll-net hr-payroll:v1
