spotless:
  mvn spotless:apply

docker-build:
  docker build -t api-atlas-hub-server:local -f docker/Dockerfile .

docker-run-local:
    docker run -p 9595:9595 api-atlas-hub-server:local