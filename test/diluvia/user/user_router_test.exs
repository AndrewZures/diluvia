defmodule UserRouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "gets user" do
    conn = Router.call(conn(:get, "/user"), @opts)
    body = conn.resp_body |> JSON.from_json |> elem(1)

    assert conn.status == 200
    assert %{hi: "hello"} == body
  end

  test "puts user" do
    conn = conn(:put, "/user") |> Router.call(@opts)
    body = conn.resp_body |> JSON.from_json |> elem(1)

    assert conn.status == 200
    assert body == %{hi: "hello"}
  end

end
