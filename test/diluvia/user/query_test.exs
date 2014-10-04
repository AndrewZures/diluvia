defmodule Diluvia.User.QueryTest do
  use ExUnit.Case, async: false
  import Diluvia.DB.Users
  import Mock

  alias Diluvia.DB.Users,   as: Users
  alias Diluvia.DB.Repo,    as: Repo
  alias Diluvia.User.Query, as: Query
  alias Diluvia.Util.Query, as: Util

  def data() do
    [ %{ name: "danny" } ]
  end

  test 'finds a user' do
    #needs implementation
  end

  test "update a user" do
    #needs stub
    attrs = %{name: "sheila"}
    Diluvia.User.Query.update(1, attrs)
  end

  test_with_mock 'creates a user',
  Repo, [insert: fn(user) -> user end,
         get: fn(_, id) -> %Users{ name: "updated" } end] do
    attrs = %{name: "updated"}
    result = Diluvia.User.Query.create(attrs)

    assert result.name == "updated"
  end

  test_with_mock 'does not add unwanted columns to user',
  Repo, [insert: fn(user) -> user end,
         get: fn(_, id) -> %Users{} end] do
    attrs = %{wrong: "wrong-value"}
    result = Diluvia.User.Query.create(attrs)

    assert result.name == nil
  end

  test_with_mock 'returns ok for successful delete',
  Repo, [get: fn(_, _) -> :ok end,
         delete: fn(_) -> :ok end] do
    hi = Diluvia.User.Query.delete(23)

    assert hi == :ok
  end

  test_with_mock 'returns nil for unsuccessful delete',
  Repo, [get: fn(_, _) -> nil end] do
    hi = Diluvia.User.Query.delete(23)

    assert hi == nil
  end

end
