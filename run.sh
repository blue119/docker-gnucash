#!/usr/bin/env bash
case $1 in
    build)
        docker build -t gnucash .
    ;;

    run)
        xhost +LOCAL:
        docker run --rm --name gnucash -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e LC_ALL=zh_TW-UTF8 \
        -v /${HOME}/Dropbox/gnucash:/work-gnucash \
        gnucash /work-gnucash/ypwang.gnucash
    ;;

    *)
        echo "$0 <buile|run>"
    ;;
esac
