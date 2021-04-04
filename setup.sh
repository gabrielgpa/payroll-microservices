#!/bin/sh

echo '---------------------------------'
echo 'Resetando ambiente...'
echo '---------------------------------'

echo ''
echo ''

echo '---------------------------------'
echo 'Removendo containers...'
echo '---------------------------------'

docker rm -f hr-api-gateway-zuul
docker rm -f suspicious_blackwell
docker rm -f xenodochial_cori
docker rm -f wizardly_knuth
docker rm -f stupefied_lederberg
docker rm -f fervent_germain
docker rm -f hr-oauth
docker rm -f hr-payroll
docker rm -f hr-user
docker rm -f hr-config-server
docker rm -f hr-eureka-server
docker rm -f hr-worker
docker rm -f hungry_austin
docker rm -f dazzling_torvalds
docker rm -f hr-user-pg12
docker rm -f hr-worker-pg12

echo ''
echo ''

echo '---------------------------------'
echo 'Removendo imagens...'
echo '---------------------------------'

echo ''
echo ''

docker rmi hr-api-gateway-zuul_ms -f
docker rmi hr-oauth_ms -f
docker rmi hr-payroll_ms -f
docker rmi hr-user_ms -f
docker rmi hr-worker_ms -f
docker rmi hr-eureka-server_ms -f
docker rmi hr-config-server_ms -f
docker rmi hr-config-server -f
docker rmi openjdk -f
docker rmi postgres -f

echo ''
echo ''

echo '---------------------------------'
echo 'Criando network hr-payroll-net'
echo '---------------------------------'

docker network create hr-payroll-net

echo ''
echo ''

echo '---------------------------------'
echo 'Baixando imagem do Postgres_12'
echo '---------------------------------'

docker pull postgres:12-alpine

echo ''
echo ''

echo '---------------------------------'
echo 'Criando banco hr-worker-pg12 para o microserviço Worker'
echo '---------------------------------'

docker run -p 5432:5432 --name hr-worker-pg12 --network hr-payroll-net -e POSTGRES_PASSWORD=1234567 -e POSTGRES_DB=db_hr_worker postgres:12-alpine -d

echo ''
echo ''

echo '---------------------------------'
echo 'Importar dump para o banco hr-worker-pg12'
echo '---------------------------------'

cat ./docs/dump_db_hr_worker.sql | docker exec -i hr-worker-pg12 psql -U postgres

echo ''
echo ''

echo '---------------------------------'
echo 'Criando banco hr-user-pg1 para o microserviço User'
echo '---------------------------------'

docker run -p 5433:5432 --name hr-user-pg12 --network hr-payroll-net -e POSTGRES_PASSWORD=1234567 -e POSTGRES_DB=db_hr_user postgres:12-alpine -d

echo ''
echo ''

echo '---------------------------------'
echo 'Importar dump para o banco hr-user-pg12'
echo '---------------------------------'

cat ./docs/dump_db_hr_user.sql | docker exec -i hr-user-pg12 psql -U postgres

echo ''
echo ''