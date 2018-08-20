defmodule Test.Mixfile do
  use Mix.Project

  def project do
    [ app: :test,
      version: "0.1.0",
      elixir: "~> 1.6",
      deps: deps(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod]
  end

  # Configuration for the OTP application
  def application do
    [mod: {Test, []},
     extra_applications: [:logger]]
  end

  defp deps do
    [
      #{:distillery, path: "../distillery"},
      {:distillery, "~> 2.0"},
      {:toml, "~> 0.1"},
      {:httpoison, "~> 1.1.0"}
    ]
  end
end
