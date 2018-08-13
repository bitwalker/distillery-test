#!/usr/bin/env bash

release_ctl eval "IO.inspect(:application.get_all_env(:test))"
