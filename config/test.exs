use Mix.Config

config :test,
  source: __ENV__.file

config :test, TestWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
