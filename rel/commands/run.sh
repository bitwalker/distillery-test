#!/bin/sh

nodetool "eval" ""'Elixir.Code.eval_string(Elixir.List.to_string(\'$2\'))'"
