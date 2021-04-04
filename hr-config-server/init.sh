#!/bin/sh
./mvnw clean package -DskipTests

docker build -t hr-config-server:v1 .

docker run -p 8888:8888 --name hr-config-server --network hr-payroll-net -e GITHUB_USER=${GITHUB_USER} -e GITHUB_PASS=${GITHUB_PASS} hr-config-server:v1
