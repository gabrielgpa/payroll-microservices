#!/bin/sh
./mvnw clean package -DskipTests

docker build -t hr-worker:v1 .

docker run -P --network hr-payroll-net hr-worker:v1
