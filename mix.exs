defmodule Test.Mixfile do
  use Mix.Project

  {_, shorthash} = System.cmd("git", ["describe", "--always"])

  @version "0.1.0+#{shorthash}"

  def project do
    [ app: :test,
      version: @version,
      elixir: "~> 1.6",
      deps: deps(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod]
  end

  # Configuration for the OTP application
  def application do
    [mod: {Test, []},
     extra_applications: [:logger, :asn1]]
  end

  defp deps do
    [
      {:distillery, path: "../distillery"},
      #{:distillery, github: "bitwalker/distillery"},
      {:toml, "~> 0.1"},
    ]
  end
end
