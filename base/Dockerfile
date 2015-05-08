FROM debian
MAINTAINER MeteorHacks Pvt Ltd.

COPY scripts /opt/meteord

RUN bash /opt/meteord/install_base.sh
RUN bash /opt/meteord/install_node.sh
RUN bash /opt/meteord/install_phantomjs.sh

EXPOSE 80
ENTRYPOINT bash /opt/meteord/run_app.sh
