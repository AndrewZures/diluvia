defmodule Diluvia.DB.Queries do
  import Ecto.Query

  def sample_query do
    query = from u in Users, select: u.name
    Diluvia.DB.Repo.all(query)
  end

end
