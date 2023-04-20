#!/bin/bash

IMAGE_NAME="quay.io/cassing/http-stub"
IMAGE_TAG=$(git rev-parse --short=7 HEAD)

docker build -t "${IMAGE_NAME}:latest" -f Dockerfile .
docker tag "${IMAGE_NAME}:latest" "${IMAGE_NAME}:${IMAGE_TAG}"

# DOCKER_CONF="${PWD}/.docker"
# mkdir -p "${DOCKER_CONF}"
# docker --config="${DOCKER_CONF}" login -u="${QUAY_USER}" -p="${QUAY_TOKEN}" quay.io

docker push "${IMAGE_NAME}:latest"
docker push "${IMAGE_NAME}:${IMAGE_TAG}"

