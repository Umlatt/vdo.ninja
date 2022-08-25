# VDO.NINJA Docker

[![Docker Pulls](https://img.shields.io/docker/pulls/umlatt/vdo.ninja.svg)](https://hub.docker.com/r/umlatt/vdo.ninja)
[![Docker Stars](https://img.shields.io/docker/stars/umlatt/vdo.ninja.svg)](https://hub.docker.com/r/umlatt/vdo.ninja)

VDO.Ninja is a project created by [`steveseguin`](https://github.com/steveseguin) for awesome streaming magic. 
VDO.NINJA Docker purely creates a convenient package for deployment.
## Project links

### Original Project
Github Project: [steveseguin/vdo.ninja](https://github.com/steveseguin/vdo.ninja)

### Docker Project 
Github Project: [umlatt/vdo.ninja](https://github.com/Umlatt/vdo.ninja)

## State

> **BETA**

## Version Info

Check [changelog](https://github.com/umlatt/vdo.ninja/blob/main/changelog.md) for more information

## Installation
### Requirements

A server with something docker flavoured

### Deployment

1. Provide the DNS name of your server in `SERVER_URL=`*
2. Provide a valid email address against which your certificate will be registered in `EMAIL_ADDRESS=`

```bash
docker run -dit -p 80:80 -p 443:443 -e SERVER_URL=$HOSTNAME -e EMAIL_ADDRESS=emailforcert@domain.com umlatt/vdo.ninja
```
### Notes

**Certificates**: 
- Certificates are created/renewed using `certbot/letsencrypt`. 
-  **NOTE**: Autorenewal of certs is not yet configured, however, rebooting the container will trigger a cert renewal.