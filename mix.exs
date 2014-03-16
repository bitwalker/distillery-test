defmodule Test.Mixfile do
  use Mix.Project

  def project do
    [ app: :test,
      version: "0.0.2",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Test, [] },
     applications: [:exirc]]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [{:exrm, path: "../exrm"},
    {:exirc, path: "../exirc"}]
  end
end
