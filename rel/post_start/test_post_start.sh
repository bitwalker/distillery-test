#!/usr/bin/env bash

set -o posix
set -e

echo "Hello from the post start!"
echo "And written to file too" > "$REL_DIR"/foo.txt
