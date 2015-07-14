defmodule Test.Server do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :test)
  end

  def init([]) do
    { :ok, [] }
  end

  def handle_call(:ping, _from, state) do
    { :reply, :v2, state}
  end

end
