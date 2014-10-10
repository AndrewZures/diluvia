defmodule Diluvia.User.Router do
  import Plug.Conn
  use Plug.Router

  alias Diluvia.User.Model, as: Model

  plug :match
  plug :dispatch

  get "/:id" do
    { status, user_data } = id |> String.to_integer |> Model.find

    if status == :ok do
      body = user_data |> Map.from_struct |> JSON.to_json
      send_resp(conn, 200, body)
    else
      send_resp(conn, 422, user_data)
    end
  end

  put "/:id" do
    body = read_body(conn) |> elem(1) |> JSON.from_json
    id = id |> String.to_integer

    {status, body} = Model.update(id, body)
    body = body |> JSON.to_json
    if status == :ok do
      send_resp(conn, 200, body)
    else
      send_resp(conn, 422, body)
    end


  end

  match _ do
    send_resp(conn, 404, "forwarded-oops")
  end

end
