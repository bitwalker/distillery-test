use Mix.Config

config :test,
  source: __ENV__.file,
  username: System.get_env("USERNAME")

port = String.to_integer(System.get_env("PORT") || "4000")
config :test, TestWeb.Endpoint,
  server: true,
  load_from_system_env: false,
  http: [port: port],
  url: [host: "localhost", port: port],
  root: ".",
  secret_key_base: "u1QXlca4XEZKb1o3HL/aUlznI1qstCNAQ6yme/lFbFIs0Iqiq/annZ+Ty8JyUCDc"
