#!/bin/bash
cd /root/dsc/vdo.ninja/
version=$1
if [[ $version ]];
then
    git clone https://github.com/steveseguin/vdo.ninja
    docker build -t umlatt/vdo.ninja:$version .
else
    printf "Version number required.\ne.g.\t$0 1.0.2\n"
fi