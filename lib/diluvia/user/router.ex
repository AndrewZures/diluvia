defmodule Diluvia.User.Router do
  import Plug.Conn
  use Plug.Router

  alias Diluvia.User.Model, as: Model

  plug :match
  plug :dispatch

  get "/:id" do
    { status, user_data } = id |> String.to_integer |> Model.find

    body = user_data |> JSON.to_json
    send_resp(conn, http_status(status), body)
  end

  put "/:id" do
    body = read_body(conn) |> elem(1) |> JSON.from_json
    id = id |> String.to_integer

    { status, body } = Model.update(id, body)
    body = body |> JSON.to_json
    send_resp(conn, http_status(status), body)
  end

  match _ do
    no_match = %{ message: "no matching route" } |> JSON.to_json
    send_resp(conn, 404, no_match)
  end

  def http_status(status) do
    if status == :ok, do: 200, else:  422
  end

end
