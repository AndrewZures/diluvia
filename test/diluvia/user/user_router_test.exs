defmodule UserRouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "gets user" do
    conn = Router.call(conn(:get, "/user"), @opts)

    result = Poison.Parser.parse(conn.resp_body, keys: :atoms!)
    assert %{hi: "hello"} == elem(result,1)
    assert conn.status == 200
  end

end
