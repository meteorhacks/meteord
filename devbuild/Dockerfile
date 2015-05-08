FROM meteorhacks/meteord:base
MAINTAINER MeteorHacks Pvt Ltd.

ONBUILD RUN bash $METEORD_DIR/lib/install_meteor.sh
ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/lib/build_app.sh