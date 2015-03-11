#!/bin/bash

cd /app
meteor build --directory /tmp/the-app

cd /tmp/the-app/bundle/programs/server/
npm i

mv /tmp/the-app/bundle /built_app

# cleanup
rm -rf /tmp/the-app
rm -rf ~/.meteor
rm /usr/local/bin/meteor