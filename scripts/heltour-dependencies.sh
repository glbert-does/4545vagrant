#!/bin/bash

# Install dependencies
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt-get upgrade --assume-yes
sudo apt-get install --assume-yes build-essential python3.9 python3.9-dev python3.9-distutils postgresql postgresql-server-dev-14 libjpeg-dev libpng-dev libgif-dev mercurial git libtiff-dev virtualenv redis curl ruby-sass openjdk-17-jre-headless
