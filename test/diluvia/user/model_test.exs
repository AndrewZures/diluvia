defmodule Diluvia.User.QueryTest do
  use ExUnit.Case, async: false
  import Mock

  alias Diluvia.User.Model,   as: Model
  alias Diluvia.DB.Users,     as: Users
  alias Diluvia.DB.Repo,      as: Repo

  test_with_mock 'finds a user',
  Repo, [get: fn(_, _) -> %Users{name: "dave"} end] do
    result = Model.find(123)

    assert result.name == "dave"
  end

  test_with_mock "returns nil if can't find user",
  Repo, [get: fn(_, _) -> nil end] do
    result = Model.find(-1)

    assert result == nil
  end

  test_with_mock "update a user",
  Repo, [update: fn(_) -> %Users{name: "sheila"} end,
         get: fn(_, _) -> %Users{} end] do
    result = Model.update(73, %{})

    assert result.name == "sheila"
  end

  test_with_mock 'creates a user',
  Repo, [insert: fn(user) -> user end,
         get: fn(_, _) -> %Users{ name: "updated" } end] do
    result = Model.create(%{})

    assert result.name == "updated"
  end

  test_with_mock 'does not add unwanted columns to user',
  Repo, [insert: fn(user) -> user end,
         get: fn(_, _) -> %Users{} end] do
    attrs = %{wrong: "wrong-value"}
    result = Model.create(attrs)

    assert result.name == nil
  end

  test_with_mock 'returns ok for successful delete',
  Repo, [get: fn(_, _) -> :ok end,
         delete: fn(_) -> :ok end] do
    hi = Model.delete(23)

    assert hi == :ok
  end

  test_with_mock 'returns nil for unsuccessful delete',
  Repo, [get: fn(_, _) -> nil end] do
    hi = Model.delete(23)

    assert hi == nil
  end

end
