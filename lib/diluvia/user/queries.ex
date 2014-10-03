defmodule Diluvia.User.Queries do
  import Ecto.Query
  alias Diluvia.DB.Users, as: Users
  alias Diluvia.Util.Query, as: QueryUtil

  def find(id) do
    query = from u in Users,
                      select: u,
                      where: u.id == ^id

    QueryUtil.run(query)
  end

end
