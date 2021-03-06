defmodule Diluvia.User.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Diluvia.Router,       as: Router
  alias Diluvia.User.Model,   as: User

  @opts Router.init([])

  setup do
    attrs = %{name: "Andrew"}
    { _, user } = User.create(attrs)

    on_exit fn ->
      User.delete(user.id)
    end

    { :ok, user: user }
  end

  test "gets user", context do
    user = context[:user]

    conn = Router.call(conn(:get, "/user/#{user.id}"), @opts)
    body = conn.resp_body |> JSON.from_json

    assert conn.status == 200
    assert Map.from_struct(user) == body
  end

  test "returns error if can't find user" do
    conn = Router.call(conn(:get, "/user/0"), @opts)

    assert conn.status == 422
  end

  test "updates user", context do
    user = context[:user]
    data = Poison.encode!(%{name: "Andrew"})
    conn = conn(:put, "/user/#{user.id}", <<"#{data}">>,
                headers: [{"content-type", "application/json"}])

    conn = conn |> Router.call(@opts)
    body = conn.resp_body |> Poison.decode!(keys: :atoms)

    assert conn.status == 200
    assert body.name == user.name
  end

  test "returns error if update fails" do
    data = Poison.encode!(%{name: "Dave"})
    conn = conn(:put, "/user/-1", <<"#{data}">>,
                headers: [{"content-type", "application/json"}])

    conn = conn |> Router.call(@opts)
    body = conn.resp_body |> Poison.decode!(keys: :atoms)

    assert conn.status == 422
    assert body.message != nil
  end

end
