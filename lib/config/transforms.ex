defmodule Test.DebugLevelTransform do
  def transform(:debug_level, dl) when is_map(dl) do
    passive? = dl[:passive] == true
    case dl[:enabled] do
      nil ->
        :off
      true when passive? ->
        {:on, [:passive]}
      true ->
        {:on, [:active]}
    end
  end
  def transform(_k, v), do: v
end
