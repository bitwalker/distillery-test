use Mix.Config

config :kernel,
  sync_nodes_timeout: 60_000

config :test,
  env: System.get_env("MIX_ENV"),
  debug_level: {:on, [:passive]}

config :logger,
  level: :debug

import_config "#{Mix.env}.exs"
