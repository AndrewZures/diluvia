defmodule Diluvia.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    tree = [worker(Diluvia.DB.Repo, [])]
    opts = [name: Simple.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end


end
