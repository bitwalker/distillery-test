use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env

environment :dev do
  set dev_mode: true
  set include_erts: false
end

environment :dev_full do
  set dev_mode: true
  set include_erts: true
end

environment :dev_toml do
  set dev_mode: true
  set include_erts: false

  transforms = [Test.DebugLevelTransform]
  set config_providers: [
    {Toml.Provider, [
      path: "${RELEASE_ROOT_DIR}/test.toml", 
      transforms: transforms
    ]}
  ]
end

environment :dev_mix do
  set dev_mode: true
  set include_erts: false
  set config_providers: [
    {Mix.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/etc/config.exs"]}
  ]
end

environment :prod do
  set include_erts: true
  set post_start_hooks: "rel/post_start"
end

environment :prod_no_erts do
  set include_erts: false
end

environment :prod_toml do
  set include_erts: true
  transforms = [Test.DebugLevelTransform]
  set config_providers: [
    {Toml.Provider, [
      path: "${RELEASE_ROOT_DIR}/test.toml",
      transforms: transforms
    ]}
  ]
end

environment :prod_mix do
  set include_erts: true
  set config_providers: [
    {Mix.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/etc/config.exs"]}
  ]
end


environment :prod_no_erts do
  set include_erts: false
end

release :test do
  set version: current_version(:test)
  set cookie: :test
  set commands: [
    run: "rel/commands/run.sh",
    config: "rel/commands/config.sh"
  ]
  set pre_start_hooks: "rel/hooks/pre_start.d"
  set overlays: [
    {:copy, "rel/configs/test.toml", "test.toml"},
    {:copy, "rel/configs/config.exs", "etc/config.exs"},
  ]
end

