# VDO Ninja Docker - Changelog

## 27.0-1 *stable*
- [x] Added environment variable `SSL=off` to disable internal SSL services

## 27.0 *stable*
- [x] Built off of latest v27.0 release of vdo.ninja

## 24.4 *stable*
- [x] nginx base image - changed to `stable` instead of `latest` due to nginx deprecating `latest`
- [x] Codebase 24.4 stable - used 24.4 release from Steve's project

## 22.9 *stable*
- [x] Updated to current build proivded in master project.
- [x] BugFix - Fixed issue in nginx init. (moved ssl init into /init folder)
- [x] Added check->start nginx if required (on boot)

## 21.1 *stable*
- [x] Updated to current build provided in master project.

## 0.1.0 *beta*
- [x] Feature: Auto cert renewal [certs can be manually renewed upon reboot of container]

## 0.0.5 *alpha*
- [x] Feature: SSL management using `certbot`, with cert renew on reboot
- [x] BugFix: Issue in nginx config file

## 0.0.2 *alpha*
- [x] Initial upload
