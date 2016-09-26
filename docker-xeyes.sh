#!/bin/bash

export XSOCK=/tmp/.X11-unix
export XAUTH=~/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm --net host   \
        -e DISPLAY=$DISPLAY  \
        -e XAUTHORITY=$XAUTH \
        -v $XSOCK:$XSOCK:rw  \
        -v $XAUTH:$XAUTH:rw  \
        xeyes "$@"
