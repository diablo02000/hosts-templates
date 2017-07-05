FROM debian:jessie-slim

ARG NODEJS_VERSION="6"

MAINTAINER diablo02000

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean
