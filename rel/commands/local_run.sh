#!/usr/bin/env bash

release_ctl eval --mfa 'IO.inspect/1' --argv -- "$@"
