defmodule UserRouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "route forwarding" do
    conn = Router.call(conn(:get, "/user"), @opts)

    assert conn.resp_body == "user"
    assert conn.status == 200
  end

end
