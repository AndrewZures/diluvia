defmodule UserRouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "gets user" do
    conn = Router.call(conn(:get, "/user"), @opts)

    result = to_json(conn)
    assert conn.status == 200
    assert %{hi: "hello"} == elem(result,1)
  end

  test "puts user" do
    conn = Router.call(conn(:put, "/user"), @opts)
    result = to_json(conn)
    assert conn.status == 200
  end

  def to_json (conn) do
    Poison.Parser.parse(conn.resp_body, keys: :atoms!)
  end



end
