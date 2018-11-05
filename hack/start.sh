#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

if [[ "${DATABASE_JDBC_URL:-X}" == "X" ]]; then
  java -jar -Dspring.profiles.active="in-memory" spring-music.jar
else
  if [[ "${DATABASE_JDBC_URL}" =~ "jdbc:mysql" ]]; then
    java -jar -Dspring.profiles.active=mysql \
              -Dspring.datasource.url=${DATABASE_JDBC_URL} \
              -Dspring.datasource.username=${DATABASE_USERNAME} \
              -Dspring.datasource.password=${DATABASE_PASSWORD} \
              -Dspring.datasource.driver-class-name=com.mysql.jdbc.Driver \
      spring-music.jar
  else
    echo "ERROR: unknown \$DATABASE_JDBC_URL protocol; currently supporting jdbc:mysql://"
    echo "-- \$DATABASE_JDBC_URL: $DATABASE_JDBC_URL"
    exit 1
  fi
fi