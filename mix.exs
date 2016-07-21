defmodule Test.Mixfile do
  use Mix.Project

  def project do
    [ app: :test,
      version: "0.1.0",
      elixir: "~> 1.3",
      deps: deps,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Test, [] },
     applications: [:logger, :timex]]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:distillery, path: "../distillery"},
      {:conform, path: "../conform"},
      {:timex, "~> 3.0"}, {:poison, ">= 0.0.0"}]
  end
end
