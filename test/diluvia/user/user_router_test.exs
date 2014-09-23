defmodule UserRouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "gets user" do
    conn = Router.call(conn(:get, "/user"), @opts)

    body = JSON.from_json(conn.resp_body)
    assert conn.status == 200
    assert %{hi: "hello"} == elem(body, 1)
  end

  test "puts user" do
    conn = Router.call(conn(:put, "/user"), @opts)
    result = JSON.from_json(conn.resp_body)
    assert conn.status == 200
  end



end
