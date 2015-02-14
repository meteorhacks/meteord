#!/bin/bash
set -e

bash ./build_it.sh

bash ./test_meteor_app.sh
bash ./test_bundle_local_mount.sh
bash ./test_bundle_web.sh
bash ./test_binary_build.sh
bash ./test_phantomjs.sh