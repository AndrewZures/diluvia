defmodule Diluvia.User.Router do
  import Plug.Conn
  use Plug.Router

  alias Diluvia.DB.Users, as: Users
  alias Diluvia.User.Model, as: Model
  alias Diluvia.Util.Query, as: Util

  plug :match
  plug :dispatch

  get "/:id" do
    user = id |> String.to_integer |> Model.find

    if user != nil do
      body = user |> Map.from_struct |> JSON.to_json
      send_resp(conn, 200, body)
    else
      send_resp(conn, 422, "ruh roh")
    end
  end

  put "/:id" do
    body = read_body(conn) |> elem(1)
    body = Poison.decode!(body)
    body = Poison.encode!(body)
    send_resp(conn, 200, body)
  end

  match _ do
    send_resp(conn, 404, "forwarded-oops")
  end

end
