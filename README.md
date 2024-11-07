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

#18 sending tarball 1.0s done
#18 DONE 2.5s
time="2024-11-06T23:47:39Z" level=debug msg="stopping session"
time="2024-11-06T23:47:40Z" level=info msg="Loaded image: nginx:patched"
time="2024-11-06T23:47:40Z" level=warning msg="--debug specified, working folder at /tmp/copa-3235261740 needs to be manually cleaned up"
Done! Check 'docker images' for the patched image.
docker images
REPOSITORY                                TAG                                                                           IMAGE ID       CREATED         SIZE
nginx                                     1.21.6-patched                                                                8945b370ac89   2 years ago     307MB
nginx                                     1.21.6                                                                        2bcabc23b454   2 years ago     418MB

With Custom Tag

./scripts/patch.sh nginx:1.21.6 1.21.6-secure

nginx                                     1.21.6-secure                                                                 a87859d4a2d2   2 years ago      307MB
nginx                                     1.21.6                                                                        2bcabc23b454   2 years ago      418MB

Let's check the status of the Vulns.

<img width="1117" alt="Screenshot 2024-11-07 at 00 03 57" src="https://github.com/user-attachments/assets/de991b1f-c586-4973-bbfd-8ccdd566038d">
<img width="1136" alt="Screenshot 2024-11-07 at 00 03 34" src="https://github.com/user-attachments/assets/de68732c-919f-421a-86ad-19cc2f84fd67">


Contributing

We welcome contributions! Please see our Contributing Guide for details.

License

This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments

Copacetic Team for the original COPA tool
Docker Team for Docker Scout integration



