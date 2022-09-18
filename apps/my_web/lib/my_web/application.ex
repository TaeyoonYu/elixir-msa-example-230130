defmodule MyWeb.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [
      {Phoenix.PubSub, name: MyWeb.PubSub},
      MyWeb.Telemetry,
      MyWeb.Endpoint
    ]
    |> Supervisor.start_link(name: __MODULE__, strategy: :one_for_one)
  end

  @impl true
  def config_change(changed, _new, removed) do
    MyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
