#!/bin/bash

# Check if image argument is provided
if [ -z "$1" ]; then
    echo "Usage: ./patch.sh <image:tag> [custom-tag-suffix]"
    echo
    echo "Examples:"
    echo "  ./patch.sh nginx:1.21.6            # Will create nginx:1.21.6-patched"
    echo "  ./patch.sh nginx:1.21.6 secure     # Will create nginx:1.21.6-secure"
    exit 1
fi

IMAGE="$1"
TAG_SUFFIX="${2:-patched}"  # Default to 'patched' if no suffix provided

# Run COPA with tag argument only if custom suffix is provided
if [ "$TAG_SUFFIX" != "patched" ]; then
    docker run --rm --privileged \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -e DOCKER_CONFIG=/root/.docker \
        copa-local:0.9.0 \
        "$IMAGE" \
        "$TAG_SUFFIX"
else
    docker run --rm --privileged \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -e DOCKER_CONFIG=/root/.docker \
        copa-local:0.9.0 \
        "$IMAGE"
fi

echo "Done! Check 'docker images' for the patched image."
