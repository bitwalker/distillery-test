defmodule Test.Server do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_), do: {:ok, []}

  def handle_call(:ping, _from, state) do
    _ = GenServer.call(Test.ServerC, :ping)
    {:reply, :v1, state}
  end
end
