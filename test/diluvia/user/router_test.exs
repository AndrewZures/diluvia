defmodule Diluvia.User.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Diluvia.Router,    as: Router
  alias Diluvia.User.Model,  as: Model

  @opts Router.init([])

  setup do
    attrs = %{name: "andrew"}
    user =  Model.create(attrs)

    on_exit fn ->
      Model.delete(user.id)
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

  test "returns 422 if can't find user" do
    conn = Router.call(conn(:get, "/user/0"), @opts)

    assert conn.status == 422
  end

  test "puts user" do
    data = Poison.encode!(%{hi: "hello"})
    conn = conn(:put,
                "/user/1",
                <<"#{data}">>,
                headers: [{"content-type", "application/json"}])
    conn = conn |> Router.call(@opts)
    body = conn.resp_body
    body = Poison.decode!(body, keys: :atoms)

    assert conn.status == 200
    assert body == %{hi: "hello"}
  end

end
