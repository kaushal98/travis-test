FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget
 		  
RUN apt-get -y --no-install-recommends install \
  aptitude \
  bash-completion \ 
  build-essential \
  cmake \
  coreutils \
  gcc \
  g++ \
  gdb \
  git-core \
  python \
  python-pip \
  libgstreamer1.0-dev \
  libssl-dev \
  g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf file

WORKDIR /app

COPY . /app
