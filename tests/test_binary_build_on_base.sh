#!/bin/bash

function clean() {
  docker rm -f binary_build
}

cd /tmp
clean

docker run -d \
    --name binary_build \
    -e ROOT_URL=http://binary_build_app \
    -e BUNDLE_URL=https://s3.amazonaws.com/zeema-data/aa.tar.gz \
    -e REBUILD_NPM_MODULES=1 \
    -p 9090:80 \
    meteorhacks/meteord:base

echo "Waiting for binary building is happening"
sleep 10

appContent=`docker logs binary_build`
clean

if [[ $appContent != *"meteorhacks/meteord:bin-build"* ]]; then
  echo "Failed: Trying to binary building on the base image"
  exit 1
fi
