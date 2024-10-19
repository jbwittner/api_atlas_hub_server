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

docker-build:
    docker build -t api-atlas-hub-server:local -f docker/Dockerfile .

docker-run-local:
    docker run -p 9595:9595 api-atlas-hub-server:local