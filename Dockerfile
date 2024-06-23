FROM python:2.7-slim-buster

RUN apt-get update && \
  apt-get install -y curl xz-utils build-essential tcl git gnupg && \
  curl -fsSL https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-arm64.tar.xz | tar -xJf - -C /usr/local --strip-components=1 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN node --version
RUN npm --version
