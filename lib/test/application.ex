defmodule Test.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Test.Database, []),
      supervisor(TestWeb.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: Test.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    TestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
