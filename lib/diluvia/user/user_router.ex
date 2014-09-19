defmodule Diluvia.UserRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "user")
  end

  match _ do
    send_resp(conn, 404, "forwarded-oops")
  end

end
