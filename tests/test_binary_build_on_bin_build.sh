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
    meteorhacks/meteord:binbuild

echo "Waiting for binary building is happening"
sleep 20

appContent=`curl http://localhost:9090`
clean

if [[ $appContent != *"binary_build_app"* ]]; then
  echo "Failed: Binary Building"
  exit 1
fi
