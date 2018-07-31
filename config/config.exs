use Mix.Config

config :kernel,
  sync_nodes_timeout: 60_000

config :distillery,
  no_warn_missing: [
    :distillery,
    :conform
  ]

config :test,
  env: :wat,
  debug_level: {:on, [:passive]}

config :sasl,
  errlog_type: :error

config :logger,
  level: :debug

config :test,
  env_var: System.get_env("MIX_HOME")

some_var = case System.get_env("MIX_HOME") do
  nil -> "prod"
  _ -> "dev"
end

import_config "config.#{some_var}.exs"
