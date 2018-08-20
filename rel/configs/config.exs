use Mix.Config

config :test,
  source: __ENV__.file,
  username: System.get_env("USERNAME")
