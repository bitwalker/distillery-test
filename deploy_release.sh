#!/bin/sh

set -e

app=$1
version=$2
release_name=test
cwd=$(pwd)
tar="$release_name.tar.gz"

cp -v releases/$release_name.tar.gz mount/
docker run -v "$cwd"/mount:/opt/mount --rm -it p711/erlang:latest /bin/sh -e -x -c "cp /opt/mount/$tar ./ && chown root $tar && tar -xzf $tar && bin/$release_name console"
