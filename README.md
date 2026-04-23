# Tftp server
Tftp server based on Alpine Linux.

## Quick reference
* Where to file issues:
[GitHub](https://github.com/gianlucavagnuzzi/tftp/issues)

* Supported architectures: amd64 , armv7 , arm64v8

## To run:
### ...by docker run:
```
docker run -di -p 69:69/udp -v /var/tftpboot:/var/tftpboot rardcode/tftp
```

### ...by docker-compose file:
```
services:
  app:
    image: rardcode/tftp
    container_name: tftp
    volumes:
    - /var/tftpboot:/var/tftpboot
    ports:
    - 69:69/udp
    restart: unless-stopped
```
## Changelog
### v3234.52r7 - 23.04.2026
- Alpine v3.23.4

### v3233.52r7 - 20.03.2026
- Alpine v3.23.3
- Tftp-hpa v5.2-r7
