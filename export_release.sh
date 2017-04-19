#!/bin/sh

set -e

app=$1
version=$2
release_name=test
cwd=$(pwd)

mkdir -p releases
mkdir -p mount
docker run -v "$cwd"/mount:/opt/mount -d --rm -t $app:$version cp ${release_name}.tar.gz /opt/mount/ && sleep 5
if [ $? -eq 0 ]; then
    cp mount/$release_name.tar.gz releases/ && \
    rm -f mount/$release_name.tar.gz
else
    exit $?
fi
