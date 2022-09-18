defmodule MyWeb.MixProject do
  use Mix.Project

  def project() do
    [
      app: :my_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application() do
    [
      mod: {MyWeb.Application, []},
      extra_applications: [:logger, :runtime_tools, :os_mon]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps() do
    [
      {:my, in_umbrella: true, runtime: false},
      {:my_cluster, in_umbrella: true, runtime: true},
      {:esbuild, "~> 0.4", runtime: Mix.env() == :dev},
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.6.12"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:phoenix_live_view, "~> 0.17.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:plug_cowboy, "~> 2.5"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_reload, "~> 1.2", only: :dev}
    ]
  end

  defp aliases() do
    [
      setup: ["deps.get"],
      "release.setup": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
