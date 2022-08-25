# VDO.NINJA Docker Deployment

[![Docker Pulls](https://img.shields.io/docker/pulls/umlatt/vdo.ninja.svg)](https://hub.docker.com/r/umlatt/vdo.ninja)
[![Docker Stars](https://img.shields.io/docker/stars/umlatt/vdo.ninja.svg)](https://hub.docker.com/r/umlatt/vdo.ninja)

VDO.Ninja is a project built by `steveseguin` for awesome streaming magic. This is just a project to build it into a self service docker container.
## Project links

### Original Project
Github Project: [steveseguin/vdo.ninja](https://github.com/steveseguin/vdo.ninja)

### Docker Project 
Github Project: [umlatt/vdo.ninja](https://github.com/Umlatt/vdo.ninja)

## State

> **BETA**

## Version Info

Check [changelog](https://github.com/umlatt/vdo.ninja/blob/master/changelog.md) for more information

## Installation
### Requirements

1. A server with docker (or some equivalent container service)

### Deploy

```bash
docker run -dit -p 80:80 -p 443:443 -e SERVER_URL=$HOSTNAME -e EMAIL_ADDRESS=emailforcert@domain.com umlatt/vdo.ninja
```
- Provide the DNS name of your server in `SERVER_URL=`*
- Provide a valid email address against which your certificate will be registered in `EMAIL_ADDRESS=`

### Notes

- **Certificates**: Certificates are collected using `certbot`/letsencrypt. Please **NOTE** that autorenewal of certs is not yet configured, however, rebooting the container will trigger a cert renewal.