FROM meteorhacks/meteord:base
MAINTAINER MeteorHacks Pvt Ltd.

ONBUILD RUN bash /opt/meteord/install_meteor.sh
ONBUILD COPY ./ /app
ONBUILD RUN bash /opt/meteord/meteord-build.sh