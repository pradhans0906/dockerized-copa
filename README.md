# Dockerized COPA - Containerized Copacetic for Image Patching

This project provides a Docker-packaged version of Copacetic (COPA) for easy deployment and integration, offering a containerized solution for patching container images with COPA.

## Quick Start

### Pull the image
```bash
docker pull pradhans0906/dockerized-copa:latest

Patch an image

docker run --rm --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DOCKER_CONFIG=/root/.docker \
  pradhans0906/dockerized-copa:latest \
  "nginx:1.21.6" \
  "1.21.6-patched"

Features

🐳 Fully containerized COPA installation
🔄 Automatic image pulling
🔍 Docker Scout integration
🍎 macOS compatibility
🖥️ Simple CLI interface

Documentation
Usage Guide
Development Guide
Contributing
Changelog

Requirements

Docker Desktop (macOS)
Docker-scout (scanner)
Internet access for pulling images

### Installation
Using Docker Pull
docker pull pradhans0906/dockerized-copa:latest
Building from Source

git clone https://github.com/pradhans0906/dockerized-copa.git
cd dockerized-copa

Build
docker build --no-cache --build-arg copa_version=0.9.0 -t copa-local:0.9.0 .

Usage Examples

./scripts/patch.sh nginx:1.21.6

With Custom Tag

./scripts/patch.sh nginx:1.21.6 1.21.6-secure

Contributing

We welcome contributions! Please see our Contributing Guide for details.

License

This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments

Copacetic Team for the original COPA tool
Docker Team for Docker Scout integration



