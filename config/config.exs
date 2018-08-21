use Mix.Config

config :kernel,
  sync_nodes_timeout: 60_000

config :test,
  namespace: Web,
  env: System.get_env("MIX_ENV"),
  debug_level: {:on, [:passive]}

config :test, TestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WLTAq0m3cyhaqufuub/5RyX8E8/s2UR2P1cVJVWn0d46GixiKO6yaTa6i8B8jbzS",
  render_errors: [view: TestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Test.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  level: :debug,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

import_config "#{Mix.env}.exs"
