FROM python:2.7-slim-buster

# https://docs.screeps.com/contributed/ps_ubuntu.html#Install-Node
RUN apt-get update && \
  apt-get install -y curl xz-utils build-essential tcl git gnupg && \
  curl -fsSL https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-arm64.tar.xz | tar -xJf - -C /usr/local --strip-components=1 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN node --version
RUN npm --version

# https://docs.screeps.com/contributed/ps_ubuntu.html#Create-Screeps-User
RUN adduser --disabled-password --gecos "" screeps
USER screeps
WORKDIR /home/screeps

# https://docs.screeps.com/contributed/ps_ubuntu.html#Setup-Server-Environment
RUN mkdir world && cd world && npm install screeps && npx screeps init
