set -e

if [ -d /bundle ]; then
  cd /bundle
  tar xzf *.tar.gz
  cd /bundle/bundle/programs/server/
  npm i
  cd /bundle/bundle/
elif [[ $BUNDLE_URL ]]; then
  cd /tmp
  wget $BUNDLE_URL -O bundle.tar.gz
  tar xzf bundle.tar.gz
  cd /tmp/bundle/programs/server/
  npm i
  cd /tmp/bundle/
else
  cd /built_app
fi

if [[ $REBULD_NPM_MODULES ]]; then
  cd programs/server
  bash /opt/meteord/rebuild_npm_modules.sh
  cd ../../
fi

export PORT=80
echo "starting meteor app on port:$PORT"
node main.js
