# VDO Ninja Docker - Changelog

## 22.9 Stable

- [x] Updated to current build proivded in master project.
- [x] BugFix - Fixed issue in nginx init. (moved ssl init into /init folder)
    - Added check->start nginx if required (on boot)

## 21.1 Stable

- [x] Updated to current build provided in master project.

## 0.1.0-beta

- [x] Feature: Auto cert renewal [certs can be manually renewed upon reboot of container]
## 0.0.5-dev

- Feature: SSL management using `certbot`, with cert renew on reboot
- BugFix: Issue in nginx config file
## 0.0.2-dev

- Initial upload
