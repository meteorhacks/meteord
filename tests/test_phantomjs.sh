#!/bin/bash

function clean() {
  docker rm -f phantomjs_check
}

clean
docker run  \
    --name phantomjs_check \
    --entrypoint="/bin/bash phantomjs -h" \
    meteord

appContent=`docker logs phantomjs_check`
clean

if [[ $appContent != *"GhostDriver"* ]]; then
  echo "Failed: Phantomjs Check"
  exit 1
fi