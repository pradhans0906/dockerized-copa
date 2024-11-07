FROM debian:12-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Get copa_version arg
ARG copa_version=0.9.0

# Install required packages and Docker
RUN apt-get update && \
    apt-get install -y \
    tar \
    ca-certificates \
    curl \
    gnupg \
    jq \
    lsb-release \
    --no-install-recommends && \
    # Set up Docker repository
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y \
    docker-ce-cli \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install Copa
RUN curl --retry 5 -fsSL -o copa.tar.gz https://github.com/project-copacetic/copacetic/releases/download/v${copa_version}/copa_${copa_version}_linux_amd64.tar.gz && \
    tar -zxvf copa.tar.gz && \
    cp copa /usr/local/bin/ && \
    chmod +x /usr/local/bin/copa && \
    rm copa.tar.gz

# Create directory for docker config
RUN mkdir -p /root/.docker

# Create entrypoint script with dynamic credentials handling
RUN echo '#!/bin/bash' > /entrypoint.sh && \
    echo 'set -e' >> /entrypoint.sh && \
    echo 'if [[ "$(uname)" == "Darwin" ]] || [[ -n "$FORCE_CREDS_CONFIG" ]]; then' >> /entrypoint.sh && \
    echo '    echo "{\"credsStore\":\"\"}" > /root/.docker/config.json' >> /entrypoint.sh && \
    echo 'fi' >> /entrypoint.sh && \
    echo 'docker pull "$1"' >> /entrypoint.sh && \
    echo 'copa patch --scanner docker-scout -i "$1" -t "${2:-patched}" --debug' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
