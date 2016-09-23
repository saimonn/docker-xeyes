FROM debian

MAINTAINER Simon Séhier <simon.sehier@camptocamp.com>

RUN apt-get update && apt-get install -y x11-apps

ENTRYPOINT /usr/bin/xeyes
