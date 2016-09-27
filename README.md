xeyes in a docker container
===========================

This simple docker app is just a reminder to me on how to build a graphical app for docker.


## How to use:

### clone git repo:
```
git clone ssh://git@github.com/saimonn/docker-xeyes.git
```

### build image with tag "xeyes"
```
cd docker-xeyes
docker build --no-cache -t xeyes .
```

### run image tagged "xeyes" (you may want to put all this in a wrapper script. See `docker-xeyes.sh` script)
```
export XSOCK=/tmp/.X11-unix
export XAUTH=~/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm                       \
        -e DISPLAY=$DISPLAY           \
        -e XAUTHORITY=$XAUTH          \
        -v $XSOCK:$XSOCK:rw           \
        -v $XAUTH:$XAUTH:rw           \
        xeyes "$@"

```
