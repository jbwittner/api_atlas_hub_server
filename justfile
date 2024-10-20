DB_PASSWORD := "ApiAtlasHub2024"
DB_USER := "apiatlashub_user"
DB_DATABASE := "apiatlashub_db"
DB_ROOT_PASSWORD := "RootPassword"
DB_CONTAINER_NAME := "apiatlashub_database"

package:
    mvn clean package -Dcheckstyle.skip -DskipTests

install:
    mvn clean install -Dcheckstyle.skip -DskipTests

test:
    mvn clean test -Dcheckstyle.skip

checkstyle:
    mvn checkstyle:checkstyle

spotless:
    mvn spotless:apply

spotless-check:
    mvn spotless:check

start-jar-dev:
    java -jar application/target/application-*.jar --spring.profiles.active=development

restore-system:
	docker exec -i {{DB_CONTAINER_NAME}} sh -c 'exec mysql -uroot -p"{{DB_ROOT_PASSWORD}}"' < sql/prepare.sql

restore-table:
	docker exec -i {{DB_CONTAINER_NAME}} sh -c 'exec mysql -uroot -p"{{DB_ROOT_PASSWORD}}" {{DB_DATABASE}}' < sql/database.sql

restore-data:
	docker exec -i {{DB_CONTAINER_NAME}} sh -c 'exec mysql -uroot -p"{{DB_ROOT_PASSWORD}}" {{DB_DATABASE}}' < sql/data.sql

backup-table:
	docker exec {{DB_CONTAINER_NAME}} sh -c 'exec mysqldump --no-data -uroot -p"{{DB_ROOT_PASSWORD}}" --single-transaction {{DB_DATABASE}}' > sql/database.sql
	docker exec {{DB_CONTAINER_NAME}} sh -c 'exec mysqldump --no-data -uroot -p"{{DB_ROOT_PASSWORD}}" --single-transaction {{DB_DATABASE}}' > infrastructure/spi-jpa/src/test/resources/sql/init_table.sql

backup-data:
	docker exec {{DB_CONTAINER_NAME}} sh -c 'exec mysqldump --no-create-info -uroot -p"{{DB_ROOT_PASSWORD}}" {{DB_DATABASE}}' > sql/data.sql

restore:
    just restore-system && just restore-table && just restore-data

backup:
    just backup-table && just backup-data

docker-build:
    docker build -t api-atlas-hub-server:local -f docker/Dockerfile .

docker-run-local:
    docker run -p 9595:9595 api-atlas-hub-server:local

start:
    docker compose -f docker/compose.yaml up -d

down:
    docker compose -f docker/compose.yaml -f docker/compose.app.yaml down -v

start-app:
    docker compose -f docker/compose.yaml -f docker/compose.app.yaml up -d

down-app:
	docker compose -f docker/compose.yaml -f docker/compose.app.yaml down serverapp

remove-app:
    docker image rm ghcr.io/jbwittner/api_atlas_hub_server:develop-latest

update-app:
    just down-app && just remove-app && just start-app

logs-app:
	docker logs api_atlas_hub_server --follow