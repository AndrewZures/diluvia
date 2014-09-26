defmodule UserRouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "gets user" do
    num = 1
    conn = Router.call(conn(:get, "/user/#{num}"), @opts)
    body = conn.resp_body |> JSON.from_json |> elem(1)

    assert conn.status == 200
    assert %{hi: "hello #{num}"} == body
  end

  test "puts user" do
    conn = conn(:put, "/user") |> Router.call(@opts)
    body = conn.resp_body |> JSON.from_json |> elem(1)

    assert conn.status == 200
    assert body == %{hi: "hello"}
  end

end
