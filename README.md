A Docker-packaged version of Copacetic (COPA) for easy deployment and integration. This project provides a containerized solution for patching container images using COPA and Docker-scout.

Quick Start
bashCopy# Pull the image
docker pull yourusername/dockerized-copa:latest

# Patch an image
docker run --rm --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DOCKER_CONFIG=/root/.docker \
  p0906swap/dockerized-copa:latest \
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

Docker Desktop (macOS))
Internet access for pulling images

Installation
Using Docker Pull

bashCopydocker pull p0906swap/dockerized-copa:latest
Building from Source
bashCopygit clone https://github.com/p0906swap/dockerized-copa.git
cd dockerized-copa
make build

Usage Examples

Basic Usage
bashCopy./scripts/patch.sh nginx:1.21.6

With Custom Tag
bashCopy./scripts/patch.sh nginx:1.21.6 1.21.6-secure

Contributing
We welcome contributions! Please see our Contributing Guide for details.
License
This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

Copacetic Team for the original COPA tool
Docker Team for Docker Scout integration
