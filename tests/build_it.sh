#!/bin/bash
docker build -t meteorhacks/meteord:base ../base
docker build -t meteorhacks/meteord:on-build ../on-build
docker build -t meteorhacks/meteord:bin-build ../bin-build