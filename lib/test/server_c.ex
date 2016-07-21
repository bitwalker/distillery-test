defmodule Test.ServerC do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_), do: {:ok, nil}

  def handle_call(:ping, _from, state) do
    resp = GenServer.call(Test.ServerB, :ping)
    {:reply, resp, state}
  end
end
