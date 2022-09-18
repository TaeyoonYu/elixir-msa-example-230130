defmodule My do
  def name() do
    MyCluster.Rpc.call(__MODULE__.Local, :name, [])
  end
end
