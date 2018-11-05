#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

java -jar -Dspring.profiles.active="in-memory" spring-music.jar