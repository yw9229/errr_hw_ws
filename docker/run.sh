#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="hw"

if ! docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
  docker build -t "$IMAGE_NAME" .
fi

docker run --rm \
  --gpus all \
  --privileged \
  -v /dev:/dev \
  -v /home/weng/hw_ws:/ws \
  -v /tmp/.Xauthorithy:/home/weng@weng-g14/.Xauthority \
  -e XAUTHORITY=/home/weng@weng-g14/.Xauthority \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -it "$IMAGE_NAME"
  
