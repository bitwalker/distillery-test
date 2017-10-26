use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set cookie: :foobar
  set include_erts: false
  set sys_config: "rel/sys.config"

  plugin Conform.ReleasePlugin
end

environment :prod do
  set cookie: :foobar
  set include_erts: true
  set include_system_libs: true
  set include_src: false
  set post_start_hook: "rel/test_post_start.sh"

  plugin Conform.ReleasePlugin
end

environment :prod_without_erts do
  set cookie: :foobar
  set include_erts: false
  set include_system_libs: false
  set include_src: false

  plugin Conform.ReleasePlugin
end

environment :alt_erts do
  set cookie: :foobar
  set include_erts: "~/erlang/19.0"
  set include_system_libs: true
  set include_src: false

  plugin Conform.ReleasePlugin
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :test do
  set version: current_version(:test)
  set commands: [
    run: "rel/commands/run.sh"
  ]
end

