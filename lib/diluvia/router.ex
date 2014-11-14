defmodule Diluvia.Router do
  import Plug.Conn
  alias ResponseWrapper, as: Router
  use Plug.Router

  plug :match
  plug :dispatch

  options _ do
    Router.basic_wrap_and_send(conn, 200, "cool beans")
  end

  forward "/user", to: Diluvia.User.Router

  match _ do
    conn |> resp(404, "oops")
  end

end

IO.puts "Running MyPlug with Cowboy on http://localhost:4000"
Plug.Adapters.Cowboy.http Diluvia.Router, []
