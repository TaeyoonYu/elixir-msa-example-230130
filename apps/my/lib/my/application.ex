defmodule My.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [
      {My.Local, Node.self()}
    ]
    |> Supervisor.start_link(name: __MODULE__, strategy: :one_for_one)
  end
end
