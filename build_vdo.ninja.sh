#!/bin/bash

version=$1
skip=$2

release=https://github.com/steveseguin/vdo.ninja/archive/refs/tags/v27.0.tar.gz

if [[ $version ]]; then
    if [[ $skip != "-s" ]] && [[ $skip != "--skip" ]]; then
        rm -rf vdo.ninja
        #git clone -b v27.0.stable https://github.com/steveseguin/vdo.ninja.git
	wget -O vdo.ninja.tar.gz $release
	tar -xvf vdo.ninja.tar.gz && rm -rf vdo.ninja.tar.gz
	mv "$(find . -maxdepth 1 -type d -name 'vdo.ninja*' | head -n 1)" vdo.ninja
    fi
    docker build -t umlatt/vdo.ninja:$version .
    docker tag umlatt/vdo.ninja:$version umlatt/vdo.ninja:latest
else
    printf "Version number required.\ne.g.\t$0 1.0.2\n"
fi
