defmodule Test.Database do
  @moduledoc false

  use GenServer
  require Logger

  def available?() do
    case :ets.lookup(__MODULE__, :up) do
      [] ->
        false
      [{_, nil}] ->
        false
      [{_, pid}] when is_pid(pid) ->
        Process.alive?(pid)
    end
  catch
    _, :badarg ->
      false
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [self()], name: __MODULE__)
  end

  def init([parent]) do
    Process.flag(:trap_exit, true)
    :ets.new(__MODULE__, [:public, :named_table, :set])
    state = %{parent: parent, pid: nil, ref: nil}
    {:ok, check(state)}
  end

  def handle_info(:check, state) do
    {:noreply, check(state)}
  end
  def handle_info({:EXIT, parent, reason}, %{parent: parent} = state) do
    {:stop, reason, state}
  end
  def handle_info({:DOWN, ref, _type, _pid, reason}, %{ref: ref} = state) do
    Logger.warn "Database is unavailable: #{inspect reason}"
    :ets.delete(__MODULE__, :up)
    {:noreply, check(%{state | pid: nil, ref: nil})}
  end

  defp check(state) do
    # TODO
    Process.send_after(self(), :check, 5_000)
    state
  end
end
