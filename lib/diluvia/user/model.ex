defmodule Diluvia.User.Model do

  alias Diluvia.DB.Repo, as: Repo
  alias Diluvia.DB.Users, as: Users

  def find(id) do
    user = Repo.get(Users, id)
    if user, do: {:ok, user}, else: {:error, %{message: "could not find user"} }
  end

  def delete(id) do
    {status, data} = user = find(id)
    if status == :ok, do: _delete(data), else: user
  end

  def create(attrs) do
    user = %Users{} |> Map.merge(attrs) |> Repo.insert
    if user,
      do: { :ok, Repo.get(Users, user.id) },
      else: { :error, %{ message: "could not create user"} }
  end

  def update(id, attrs) do
    { status, data } = user = find(id)
    if status == :ok,
      do: _update(data, attrs),
      else: user
  end

  defp _update(user, attrs) do
    user |> Map.merge(attrs) |> Repo.update
    if user,
      do: find(user.id),
      else: { :error, %{ message: "could not update user"} }
  end

  defp _delete(user) do
    deleted = user |> Repo.delete
    if deleted,
      do: { :ok, %{ message: "user deleted" } },
      else: { :error, %{ message: "could not delete user"} }
  end

end
