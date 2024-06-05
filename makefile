create-network:
	docker network create -d my_puente_mis_normas


build-mysql-db:
	docker build -t  DBodoo  . 

build-node-app:
	docker build . -t node

run-mysql-db:
	docker run -d --network my_puente_mis_normas -v mydata:/var/lib/mysql  --name server odooServer

stop-mysql-db:
	docker stop mysql-db-run

run-node-app:
	docker run -d --network my_puente_mis_normas -p 54321:3000 -e DESTINO="server" --name node-app-run node

stop-node-app:
	docker container stop node-app-run

rm-node-app:
	docker container rm node-app-run

extract:
	docker cp a864a60c2211:/etc/mysql/mysql.conf.d/mysqld.cnf /home/alumne-dam/Documents/dockerJS/mysqld.cnf
stop-all:
	stop-node-app rm-node-app stop-mysql-db rm-mysql-db rm-network

build-all:
	build-mysql-db build-node-app

run-all:
	stop-all build-all create-network run-mysql-db run-node-app

build-volumne:
	docker volume create mydata