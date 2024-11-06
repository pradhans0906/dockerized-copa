#!/bin/bash

# Check if image argument is provided
if [ -z "$1" ]; then
    echo "Usage: ./patch.sh <image:tag> [output-tag]"
    exit 1
fi

IMAGE="$1"
TAG="${2:-patched}"

# Run COPA
docker run --rm --privileged \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e DOCKER_CONFIG=/root/.docker \
    copa-local:0.9.0 \
    "$IMAGE" \
    "$TAG"

echo "Done! Check 'docker images' for the patched image."
