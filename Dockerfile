FROM alpine:3.9

RUN apk --update --no-cache upgrade

ENV WORK_HOME="/root/bzt" 

COPY quick_test.yml /root/

WORKDIR $WORK_HOME

RUN apk add --update --no-cache \
            openjdk8-jre \
            nodejs \
            nodejs-npm \
            lxdm \
            setxkbmap \
            udev \
            vino \
            unzip \
            build-base \
            git \
            bash \
            curl \
            wget \
            sudo \
            ruby \
            nodejs \
            python-dev \
            py-pip \
            py-psutil \
            icu-dev \
            openssl-dev \
            bzip2-dev \
            fuse-dev \
            musl-dev \
            libxml2-dev \
            libxslt-dev \
            linux-headers && \
  pip install --upgrade pip setuptools && \
  pip install bzt locustio selenium && \
  pip install --upgrade selenium && \
  npm install -g mocha && \
  mkdir -p "$WORK_HOME" && \
  rm -rf /var/cache/apk/* && \
  bzt /root/quick_test.yml && \
  apk del --update --no-cache build-base musl-dev bzip2-dev openssl-dev \
          linux-headers libxml2-dev \
          fuse-dev icu-dev python-dev ruby-dev 
