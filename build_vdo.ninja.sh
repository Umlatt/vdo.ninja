#!/bin/bash
version=$1
github_accerss_key="github_pat_YOUR_GITHUB_KEY_HERE"
version=$(curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $github_accerss_key" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/steveseguin/vdo.ninja/releases | jq -r '.[0].tag_name' | sed 's/v//g')
if [[ -n $version ]];
then
    tag="$version-stable"
    # Check if it is not already built
    response=$(curl -sSL -o /dev/null -w "%{http_code}" "https://hub.docker.com/v2/repositories/umlatt/vdo.ninja/tags/$tag")
    if [[ $response == "200" ]]; then
        echo "Image already exists for version $tag." >> "$script_directory/build.log"
    else
        script_directory=$(dirname "$(readlink -f "$0")")
        cd "$script_directory"
        rm -rf vdo.ninja
        git clone https://github.com/steveseguin/vdo.ninja
        docker build -t umlatt/vdo.ninja:"$tag" .
        if [[ $? -eq 0 ]]; then
            docker tag umlatt/vdo.ninja:"$tag" umlatt/vdo.ninja:latest
            docker push umlatt/vdo.ninja:"$tag" && docker push umlatt/vdo.ninja:latest
        else
            printf "[ERROR] Failed to build the image" > "$script_directory/error.log"
        fi
    fi

else
    printf "[ERROR] Could not get the latest build version from Github." > "$script_directory/error.log"
fi
