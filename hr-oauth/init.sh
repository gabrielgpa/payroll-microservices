#!/bin/sh
./mvnw clean package -DskipTests

docker build -t hr-oauth:v1 .

docker run -P --network hr-payroll-net hr-oauth:v1
