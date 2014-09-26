defmodule Diluvia.DB.Queries do
  import Ecto.Query

  def sample_query do
    query = from u in Users, select: u
    Diluvia.DB.Repo.map_all(query) |> Enum.map(&(Map.from_struct(&1)))
  end

end
