defmodule SwapiExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :swapi_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: false, # This is effectively a script to run once.
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.16.0"},
      {:jason, "~> 1.1"}
    ]
  end
end
