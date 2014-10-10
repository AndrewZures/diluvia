defmodule Diluvia.User.QueryTest do
  use ExUnit.Case, async: false

  alias Diluvia.User.Model,   as: Model

  setup do
    attrs = %{name: "David"}
    user =  Model.create(attrs)

    on_exit fn ->
      Model.delete(user.id)
    end

    { :ok, user: user }
  end

  test 'finds a user', context do
    user = context[:user]
    result = Model.find(user.id)

    assert result.name == user.name
  end

  test "returns nil if can't find user" do
    result = Model.find(-1)

    assert result == nil
  end

  test "update a user", context do
    user = context[:user]
    Model.update(user.id, %{name: "Sheila"})
    result = Model.find(user.id)

    assert result.name == "Sheila"
  end

  test 'creates a user' do
    result = Model.create(%{name: "David"})

    assert result.name == "David"
  end

  test 'does not add unwanted columns to user' do
    attrs = %{wrong: "wrong-value"}
    result = Model.create(attrs)

    assert result.name == nil
  end

  test 'returns ok for successful delete', context do
    user = context[:user]
    assert user != nil

    result = Model.delete(user.id)
    user = Model.find(user.id)

    assert result == :ok
    assert user == nil
  end

  test 'returns nil for unsuccessful delete' do
    result = Model.delete(-1)

    assert result == nil
  end

end
