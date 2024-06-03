cd /root/dsc/vdo.ninja/
version=$1
skip=$2

if [[ $version ]]; then
    if [[ $skip != "-s" ]] && [[ $skip != "--skip" ]]; then
        rm -rf vdo.ninja
        git clone -b v24.4.stable https://github.com/steveseguin/vdo.ninja.git
    fi
    docker build -t umlatt/vdo.ninja:$version .
    docker tag umlatt/vdo.ninja:$version umlatt/vdo.ninja:latest
else
    printf "Version number required.\ne.g.\t$0 1.0.2\n"
fi
