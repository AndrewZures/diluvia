defmodule Diluvia.User.Queries do
  import Ecto.Query

  def sample_query do
    query = from u in Diluvia.DB.Users, select: u
    Diluvia.DB.Repo.all(query) |> Enum.map(&(Map.from_struct(&1)))
  end

end
