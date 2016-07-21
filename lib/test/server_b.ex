defmodule Test.ServerB do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_), do: {:ok, nil}

  def handle_call(:ping, _from, state) do
    {:reply, :v2, state}
  end
end
