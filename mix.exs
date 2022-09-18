defmodule My.Umbrella.MixProject do
  use Mix.Project

  def project() do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      releases: releases()
    ]
  end

  defp deps() do
    []
  end

  defp aliases() do
    [
      setup: ["cmd mix setup"],
      "release.setup": ["cmd mix release.setup"]
    ]
  end

  defp releases() do
    [
      my: [
        include_executables_for: [:unix],
        applications: [
          my: :permanent,
          my_cluster: :permanent
        ]
      ],
      my_web: [
        include_executables_for: [:unix],
        applications: [
          my: :load,
          my_cluster: :permanent,
          my_web: :permanent
        ]
      ]
    ]
  end
end
