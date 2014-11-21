defmodule Diluvia.RouterTest do
  use ExUnit.Case, async: true
  alias Diluvia.Router, as: Router
  use Plug.Test

  @opts Router.init([])

  test "handles options method" do
    conn = conn(:options, "/")
    conn = Router.call(conn, @opts)

    assert conn.status == 200
    assert conn.resp_body == "cool beans"
  end

  test "handles options method for any route" do
    conn = conn(:options, "user/1")
    conn = Router.call(conn, @opts)

    assert conn.status == 200
    assert conn.resp_body == "cool beans"
  end

end
