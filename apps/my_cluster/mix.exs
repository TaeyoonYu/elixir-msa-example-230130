defmodule MyCluster.MixProject do
  use Mix.Project

  def project() do
    [
      app: :my_cluster,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application() do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {MyCluster.Application, []}
    ]
  end

  defp deps() do
    [
      {:libcluster, "~> 3.3"}
    ]
  end

  defp aliases() do
    [
      setup: ["deps.get"],
      "release.setup": []
    ]
  end
end
