FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /opt/buildroot
WORKDIR /opt/buildroot

ADD https://buildroot.org/downloads/buildroot-2020.11.1.tar.gz ./

RUN apt-get update && apt-get install -y --no-install-recommends \
  bc \
  build-essential \
  binutils \
  ca-certificates \
  cmake \
  cpio \
  python3 \
  locales \
  unzip \
  wget \
  bzr \
  git \
  cvs \
  mercurial \
  rsync \
  subversion \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && /usr/sbin/locale-gen
ENV LC_ALL=en_US.UTF-8
