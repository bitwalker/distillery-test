defmodule Test.Tasks do
  def run(argv) do
    IO.inspect(argv, label: "task argv")
  end
end
