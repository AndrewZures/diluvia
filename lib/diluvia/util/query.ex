defmodule Diluvia.Util.Query do
  alias Diluvia.DB.Repo, as: Repo

  def run(query) do
    Repo.all(query) |> destruct_query
  end

  def destruct_query(structs) do
    structs |> Enum.map(&(Map.from_struct(&1)))
  end

end
