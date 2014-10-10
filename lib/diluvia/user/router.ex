defmodule Diluvia.User.Router do
  import Plug.Conn
  use Plug.Router

  alias Diluvia.User.Model, as: Model

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
    body = read_body(conn) |> elem(1) |> JSON.from_json
    id = id |> String.to_integer
    body = Model.update(id, body)
    if body == nil do
      body = %{id: nil, name: nil}
    end

    body = body |> JSON.to_json

    send_resp(conn, 200, body)
  end

  match _ do
    send_resp(conn, 404, "forwarded-oops")
  end

end
