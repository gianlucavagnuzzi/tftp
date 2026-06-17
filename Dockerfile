
## https://hub.docker.com/_/alpine/tags
FROM alpine:3.24.1

## https://pkgs.alpinelinux.org/packages?name=tftp-hpa&branch=v3.23&repo=&arch=x86_64&origin=&flagged=&maintainer=
ENV tftpV="tftp-hpa=~5.2-r7"

LABEL org.opencontainers.image.authors="rardcode <sak37564@ik.me>"
LABEL Description="Tftp server based on Debian."

ENV APP_NAME="tftp"

RUN set -xe && \
  : "---------- ESSENTIAL packages INSTALLATION ----------" && \
  apk update --no-cache && \
  apk upgrade --available && \
  apk add bash

RUN set -xe && \
  : "---------- SPECIFIC packages INSTALLATION ----------" && \
  apk update --no-cache && \
  apk add --upgrade ${tftpV}

ADD rootfs /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["in.tftpd", "--ipv4", "--foreground", "--listen", "--address", "0.0.0.0:69", "--create", "--secure", "-vvv", "/var/tftpboot"]
