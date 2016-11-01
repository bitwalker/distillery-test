use Mix.Config

config :distillery,
  no_warn_missing: [
    :distillery,
    :conform
  ]

config :test,
  env: :wat,
  "debug_level": {:on, [:passive]}

config :sasl,
  errlog_type: :error

config :logger,
  level: :debug

import_config "config.#{Mix.env}.exs"
