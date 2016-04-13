# docker-android

[![Build Status](https://travis-ci.org/piotrgiedziun/docker-android.svg?branch=master)](https://travis-ci.org/piotrgiedziun/docker-android)

Android environment for the project testing

```
FROM piotrgiedziun/docker-android

WORKDIR /app

COPY app/build.gradle app/

CMD ./gradlew clean build

COPY . /app

CMD ./gradlew clean test
```
