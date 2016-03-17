FROM ubuntu:12.04

MAINTAINER ksoichiro "piotrgiedziun@gmail.com"

RUN apt-get update -qq

RUN apt-get install -y --no-install-recommends openjdk-7-jdk libgd2-xpm ia32-libs ia32-libs-multiarch

RUN apt-get install -y wget
RUN cd /opt && wget -q http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
RUN cd /opt && tar xzf android-sdk_r24.4.1-linux.tgz
RUN cd /opt && rm -f android-sdk_r24.4.1-linux.tgz

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN echo y | android update sdk --no-ui --all --filter "tools"

RUN echo y | android update sdk --no-ui --all --filter platform-tools

RUN echo y | android update sdk --no-ui --all --filter android-22

RUN echo y | android update sdk --no-ui --all --filter extra-android-support

RUN echo y | android update sdk --no-ui --all --filter build-tools-23.0.2

RUN echo y | android update sdk --no-ui --all --filter extra-android-m2repository

RUN echo $JAVA_HOME

RUN echo $ANDROID_HOME

ADD . /app

WORKDIR /app