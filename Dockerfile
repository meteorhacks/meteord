FROM ubuntu
MAINTAINER MeteorHacks Pvt Ltd.

RUN mkdir -p /opt/meteord
COPY ./*.sh /opt/meteord/

RUN bash /opt/meteord/install_base.sh
RUN bash /opt/meteord/install_node.sh

ONBUILD COPY ./ /app
ONBUILD RUN bash /opt/meteord/meteord-build.sh

ENTRYPOINT bash /opt/meteord/run_app.sh