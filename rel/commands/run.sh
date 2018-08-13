#!/bin/sh

erl -noshell -eval "io:format(\"~p.\", [code:root_dir()])." -s erlang halt
