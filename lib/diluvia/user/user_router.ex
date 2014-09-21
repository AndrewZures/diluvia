defmodule Diluvia.UserRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    # body = Poison.Encoder.encode(%{hi: "hello"}, [])
    body = Poison.Encoder.encode(%{hi: "hello"}, [])
    send_resp(conn, 200, body)
  end

  match _ do
    send_resp(conn, 404, "forwarded-oops")
  end

end
