defmodule RiftEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :rift_ex,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      aliases: aliases(),
      description: "League of Legends API client",
      package: package(),
      licenses: "Apache 2.0",
      links: nil,
      preferred_cli_env: [
        vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Joel Atherley"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/jnatherley/riftex"}
    ]
  end

  # Specifies which paths to compile per environment. From Phoenix
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0"},
      {:mojito, "~> 0.6.1"},
      {:jason, "~> 1.1"},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false, },
      {:exvcr, "~> 0.10", only: [:test, :dev]}
    ]
  end

  defp aliases do
    []
  end
end
