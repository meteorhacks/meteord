set -e

if [ -d /bundle ]; then
  cd /bundle
  tar xzf *.tar.gz
  cd /bundle/bundle/programs/server/
  npm i
  cd /bundle/bundle/
else
  cd /built_app
fi

export PORT=80
echo "starting meteor app on port:$PORT"
node main.js
