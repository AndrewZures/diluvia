defmodule Diluvia.Users do
  import Ecto.Query

  def find(id) do
    query = from u in Diluvia.DB.Users, select: u
    Diluvia.DB.Repo.all(query) |> Enum.map(&(Map.from_struct(&1)))
  end

end
