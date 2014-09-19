defmodule Diluvia.Router do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/user", to: Diluvia.UserRouter

  get "/" do
    # send_resp(conn, 200, "world")
    conn |> resp(200, "world")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

end

IO.puts "Running MyPlug with Cowboy on http://localhost:4000"
Plug.Adapters.Cowboy.http Diluvia.Router, []
