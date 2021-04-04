#!/bin/sh
./mvnw clean package -DskipTests

docker build -t hr-api-gateway-zuul:v1 .

docker run -p 8765:8765 --name hr-api-gateway-zuul --network hr-payroll-net hr-api-gateway-zuul:v1