use Mix.Config

config :test,
  foo: "nope",
  env: :none,
  "debug_level": {:on, [:passive]}

import_config "config.#{Mix.env}.exs"
