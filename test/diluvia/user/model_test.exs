defmodule Diluvia.User.QueryTest do
  use ExUnit.Case, async: false

  alias Diluvia.User.Model,   as: Model

  setup do
    attrs = %{name: "David"}
    { _, user } =  Model.create(attrs)

    on_exit fn ->
      Model.delete(user.id)
    end

    { :ok, user: user }
  end

  test 'finds a user', context do
    user = context[:user]
    { status, result } = Model.find(user.id)

    assert status == :ok
    assert result.name == user.name
  end

  test "returns an error if can't find user" do
    { status, result } = Model.find(-1)

    assert status == :error
    assert result != nil
  end

  test "update a user", context do
    user = context[:user]
    { _, updated_user } = Model.update(user.id, %{name: "Sheila"})

    assert updated_user.name == "Sheila"
  end

  test "returns error if could not update user" do
    { status, _ } = Model.update(0, %{name: "Sheila"})

    assert status == :error
  end

  test 'creates a user' do
    { status, result } = Model.create(%{name: "David"})

    assert status == :ok
    assert result.name == "David"
  end

  test 'does not add unwanted columns to user' do
    attrs = %{wrong: "wrong-value"}
    { status, result } = Model.create(attrs)

    assert status == :ok
    assert result.name == nil
  end

  test 'returns ok for successful delete', context do
    user = context[:user]

    { delete_status, _ } = Model.delete(user.id)
    { find_status, _ } = Model.find(user.id)

    assert delete_status == :ok
    assert find_status == :error
  end

  test 'returns nil for unsuccessful delete' do
    { status, _ } = Model.delete(-1)

    assert status == :error
  end

end
