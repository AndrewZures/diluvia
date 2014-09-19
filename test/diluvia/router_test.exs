defmodule Diluvia.RouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "connection" do
    conn = conn(:get, "/")
    conn = Router.call(conn, @opts)

    assert conn.status == 200
    assert conn.resp_body == "world"
  end

end
