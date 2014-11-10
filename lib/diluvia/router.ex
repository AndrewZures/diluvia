defmodule Diluvia.Router do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/user", to: Diluvia.User.Router

  get "/" do
    IO.puts conn.method
    conn |> resp(200, "world")
  end

  match _ do
    IO.puts 'WHOA'
    IO.puts conn.method
    conn |> resp(404, "oops")
  end

end

IO.puts "Running MyPlug with Cowboy on http://localhost:4000"
Plug.Adapters.Cowboy.http Diluvia.Router, []
