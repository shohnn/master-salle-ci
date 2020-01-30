#!/bin/bash

docker rm -f code-with-quarkus || true

docker build \
    -f src/main/docker/Dockerfile.jvm \
    -t quarkus/code-with-quarkus .

docker run \
    --name code-with-quarkus
    -d -p 8080:8080 \
    quarkus/code-with-quarkus

docker push uarkus/code-with-quarkus
