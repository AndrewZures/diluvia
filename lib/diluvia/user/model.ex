defmodule Diluvia.User.Model do

  alias Diluvia.DB.Repo, as: Repo
  alias Diluvia.DB.Users, as: Users

  def find(id) do
    Repo.get(Users, id)
  end

  def delete(id) do
    user = Repo.get(Users, id)
    if user, do: user |> Repo.delete
  end

  def create(attrs) do
    user = %Users{} |> Map.merge(attrs) |> Repo.insert
    if user, do: Repo.get(Users, user.id)
  end

  def update(id, attrs) do
    user = Repo.get(Users, id)
    if user, do: user |> Map.merge(attrs) |> Repo.update
  end

end
