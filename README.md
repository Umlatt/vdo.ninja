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

> **STABLE**

## Version Info

Check [changelog](https://github.com/umlatt/vdo.ninja/blob/main/changelog.md) for more information

## Installation
### Requirements

A server with something docker flavoured

### Deployment

#### Auto SSL (using lets encrypt)
1. Provide the DNS name of your server in `SERVER_URL=`
2. Provide a valid email address against which your certificate will be registered in `EMAIL_ADDRESS=`

```bash
docker run -dit -p 80:80 -p 443:443 --restart=unless-stopped --name vdo.ninja -e SERVER_URL=$HOSTNAME -e EMAIL_ADDRESS=emailforcert@domain.com umlatt/vdo.ninja
```

**Certificates**: 
- Certificates are created/renewed using `certbot/letsencrypt`. 
-  **NOTE**: Autorenewal of certs is not yet configured, however, rebooting the container will trigger a cert renewal.
-  **NOTE**: **A VALID DNS NAME IS REQUIRED FOR HTTPS**. This is a requirement of HTTPS, not this deployment.

**START DELAY**
- Please note that, depending on your connection to the let's encrypt service, it may take a little time of your DNS to be registered. You can track the progress by following the steps below. This is typically a matter of several seconds (if a valid DNS name is provided)

```bash
docker logs --follow vdo.ninja
```
You will see the steps of https registration and the output should provide you with the domain name that you configured.

#### Without auto SSL

You may be using a reverse proxy to handle your SSL termination. In this case you can provide the environment variable `SSL=off`.

```bash
docker run -dit -p 80:80 --restart=unless-stopped --name vdo.ninja -e SSL=off umlatt/vdo.ninja
```
