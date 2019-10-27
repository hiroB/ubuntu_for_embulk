FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y locales \
    && locale-gen ja_JP.UTF-8 \
    && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

# for Java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN apt-get update \
    && apt-get install -y openjdk-8-jdk \
    && update-alternatives --config java \
    && update-alternatives --config javac

# for Ruby
RUN apt-get -y install build-essential automake git zlib1g-dev libssl-dev libreadline6-dev libyaml-dev libxml2-dev libxslt-dev libcurl4-openssl-dev libmysqlclient-dev libffi-dev \
 && apt-get -y install wget \
 && wget --no-check-certificate https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz \
 && tar zxf ruby-2.4.1.tar.gz \
 && cd ruby-2.4.1 \
 && ./configure && make && make install  \
 && cd ..  \
 && rm -f ruby-2.4.1.tar.gz  \
 && rm -rf ruby-2.4.1 \
 && gem install bundler

CMD "/bin/bash"
