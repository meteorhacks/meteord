#!/bin/bash
docker build -t meteorhacks/meteord:base ../base
docker build -t meteorhacks/meteord:onbuild ../onbuild
docker build -t meteorhacks/meteord:devbuild ../devbuild
docker build -t meteorhacks/meteord:binbuild ../binbuild