#!/bin/bash

function clean() {
  docker rm -f web
}

cd /tmp
clean

docker run -d \
    --name web \
    -e ROOT_URL=http://web_app \
    -e BUNDLE_URL=https://s3.amazonaws.com/zeema-data/aa.tar.gz \
    -p 9090:80 \
    meteorhacks/meteord:base

sleep 8

appContent=`curl http://localhost:9090`
clean

if [[ $appContent != *"web_app"* ]]; then
  echo "Failed: Bundle web"
  exit 1
fi