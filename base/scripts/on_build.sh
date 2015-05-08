#!/bin/bash
curl https://install.meteor.com | /bin/sh

cd /app
meteor build --directory /tmp/the-app --server=http://localhost:3000

cd /tmp/the-app/bundle/programs/server/
npm i

mv /tmp/the-app/bundle /built_app

# cleanup
rm -rf /tmp/the-app
rm -rf ~/.meteor
rm /usr/local/bin/meteor
