defmodule MyCluster.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [{Cluster.Supervisor, [Application.get_env(:my_cluster, MyCluster), [name: MyCluster]]}]
    |> Supervisor.start_link(name: __MODULE__, strategy: :one_for_one)
  end
end
