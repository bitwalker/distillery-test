use Mix.Config

config :test,
  source: __ENV__.file

config :test, TestWeb.Endpoint,
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json",
  version: Application.spec(:test, :vsn)

config :logger,
  level: :info,
  handle_sasl_reports: true,
  handle_otp_reports: true
