FROM ubuntu:16.04
MAINTAINER Kaushal Patel <kaushal.patel@xperi.com>

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
  libssl-dev

WORKDIR /app

COPY . /app
