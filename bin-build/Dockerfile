FROM meteorhacks/meteord:base
MAINTAINER MeteorHacks Pvt Ltd.

COPY scripts/install_binbuild_tools.sh /opt/meteord/install_binbuild_tools.sh
COPY scripts/rebuild_npm_modules.sh /opt/meteord/rebuild_npm_modules.sh

RUN bash /opt/meteord/install_binbuild_tools.sh
