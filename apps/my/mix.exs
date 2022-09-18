defmodule My.MixProject do
  use Mix.Project

  def project() do
    [
      app: :my,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application() do
    [
      mod: {My.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps() do
    [
      {:my_cluster, in_umbrella: true, runtime: true}
    ]
  end

  defp aliases() do
    [
      setup: ["deps.get"],
      "release.setup": []
    ]
  end
end
