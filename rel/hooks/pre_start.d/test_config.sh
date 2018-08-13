#!/usr/bin/env bash

release_ctl eval "IO.inspect(Application.get_all_env(:test))"
