#!/bin/bash

function clean() {
  docker rm -f localmount
  rm -rf localmount
}

cd /tmp
clean

meteor create localmount
cd localmount
meteor build --architecture=os.linux.x86_64 ./

docker run -d \
    --name localmount \
    -e ROOT_URL=http://localmount_app \
    -v /tmp/localmount:/bundle \
    -p 9090:80 \
    meteorhacks/meteord:base

sleep 5

appContent=`curl http://localhost:9090`
clean

if [[ $appContent != *"localmount_app"* ]]; then
  echo "Failed: Bundle local mount"
  exit 1
fi