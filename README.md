# Release Manager Test

Follow these steps to do a test upgrade of an app, along with a dependency (:timex)

- Clone it
- Prepare deployment directory e.g. `mkdir -p /tmp/test/releases/0.2.0`
- Fetch deps and build: `cd distillery-test && mix do deps.get, compile`
- Build release: `mix distillery.init && mix distillery.release --env=prod`
- Deploy release: `cp _build/dev/rel/test/releases/0.1.0/test.tar.gz /tmp/test/`
- Start release: `cd /tmp/test && tar -xf test.tar.gz && ./bin/test start`
- Verify with:
  - `./bin/test ping`
  - `./bin/test remote_console`
  - At prompt `GenServer.call(Test.Server, :ping)`, should return `:v1`
- Make some changes, bump the version to `0.2.0`
- `mix release --env=prod --upgrade`
- Deploy upgrade: `cp _build/dev/rel/test/releases/0.2.0/test.tar.gz /tmp/test/releases/0.2.0/`
- Apply upgrade: `cd /tmp/test && ./bin/test upgrade "0.2.0"`
- Verify your changes are present in the upgraded version
