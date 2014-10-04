defmodule Diluvia.User.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  import Mock

  alias Diluvia.Router,    as: Router
  alias Diluvia.DB.Users,  as: Users
  alias Diluvia.DB.Repo,      as: Repo

  @opts Router.init([])

  test_with_mock "gets user",
  Repo, [get: fn(_,_) -> %Users{id: 123, name: "char name"} end] do
    conn = Router.call(conn(:get, "/user/123"), @opts)
    body = conn.resp_body |> JSON.from_json |> elem(1)

    assert conn.status == 200
    assert %{ id: 123, name: "char name" } == body
  end

  test "puts user" do
    conn = conn(:put, "/user") |> Router.call(@opts)
    body = conn.resp_body |> JSON.from_json |> elem(1)

    assert conn.status == 200
    assert body == %{hi: "hello"}
  end

end
