# Release Manager Test

Follow these steps to do a test upgrade of an app, along with a dependency (:timex)

- Clone it
- Prepare deployment directory e.g. `mkdir -p /tmp/test/releases/0.0.2`
- Fetch deps and build: `cd exrm-test && mix do deps.get, mix compile`
- Build release: `mix release`
- Deploy release: `cp rel/test/releases/0.0.1/test.tar.gz /tmp/test/`
- Start release: `cd /tmp/test && tar -xf test.tar.gz && ./bin/test start`
- Verify with:
  - `./bin/test ping`
  - `./bin/test remote_console`
  - At prompt `:gen_server.call(:test, :ping)`, should return `:v1`
- Checkout upgraded version: `cd path/to/exrm-test && git checkout v2`
- `mix do deps.get, mix compile`
- `mix release`
- Deploy upgrade: `cp rel/test/releases/0.0.2/test.tar.gz /tmp/test/releases/0.0.2/`
- Apply upgrade: `cd /tmp/test && ./bin/test upgrade "0.0.2"`
- Verify with:
  - `./bin/test remote_console`
  - At prompt: `:gen_server.call(:test, :ping)`, should return `:v2`

