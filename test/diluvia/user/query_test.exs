defmodule Diluvia.User.QueryTest do
  use ExUnit.Case, async: false
  import Diluvia.DB.Users
  import Mock

  alias Diluvia.DB.Repo,    as: Repo
  alias Diluvia.User.Query, as: Query
  alias Diluvia.Util.Query, as: Util

  def data() do
    [ %{ name: "danny" } ]
  end

  # test_with_mock 'finds a user',
  #   Util, [run: fn(_) -> data end] do
  #     query = Query.find(1)
  #     user = query |> hd
  #
  #     assert user |> Map.get(:name) == "danny"
  # end
  #
  # test_with_mock 'returns empty list if no user found',
  #   Util, [run: fn(_) -> [] end] do
  #     query = Query.find(1)
  #     assert query == []
  # end

  test 'update a user' do
    attrs = %{name: "sheila"}
    Diluvia.User.Query.update(1, attrs)
  end

  test 'creates a user' do
    attrs = %{name: "created"}
    Diluvia.User.Query.create(attrs)
  end

  test_with_mock 'returns ok for successful delete',
  Repo, [get: fn(_, _) -> :ok end,
         delete: fn(_) -> :ok end] do
    hi = Diluvia.User.Query.delete(23)
    assert hi == :ok
  end

  test_with_mock 'delete a user',
  Repo, [get: fn(_, _) -> nil end] do
    hi = Diluvia.User.Query.delete(23)
    assert hi == nil
  end

end
