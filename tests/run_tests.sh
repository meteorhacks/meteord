#!/bin/bash
set -e

TEST_DIR=`pwd`
bash ./build_it.sh

cd $TEST_DIR
bash ./test_meteor_app.sh