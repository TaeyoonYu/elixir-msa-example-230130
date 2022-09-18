defmodule MyCluster.Rpc do
  def call(module, function, args) do
    application = Application.get_application(module)

    if MyCluster.is_my_application(application) do
      apply(module, function, args)
    else
      application
      |> MyCluster.find_node()
      |> :rpc.call(module, function, args)
    end
  end
end
