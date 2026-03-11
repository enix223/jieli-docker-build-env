FROM ubuntu:16.04

RUN apt update &&  apt upgrade -y

ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y \
      build-essential \
      git \
      make \
      cmake \
      openssl \
      libdbus-1-3 \
      libicu-dev \
      libglib2.0-0 \
      libsm6 \
      libxkbcommon0 \
      libfontconfig1 \
      libgbm1 \
      libegl1-mesa \
      libgl1 \
      python3 \
      curl

RUN mkdir /opt/jieli
RUN mkdir /opt/jieli/post-build
WORKDIR /tmp
RUN curl -L -o toolchain.tar.xz https://pkgman.jieliapp.com/s/linux-toolchain
RUN tar -xf /tmp/toolchain.tar.xz -C /opt/jieli --strip-components=1

RUN curl -L -o /tmp/post-build.tar.xz https://pkgman.jieliapp.com/s/linux-postbuild
RUN tar -xf /tmp/post-build.tar.xz -C /opt/jieli/post-build --strip-components=1

ENV PATH="/opt/jieli/common/bin/:/opt/jieli/post-build:${PATH}"

