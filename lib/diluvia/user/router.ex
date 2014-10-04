defmodule Diluvia.User.Router do
  import Plug.Conn
  use Plug.Router

  alias Diluvia.User.Model, as: Model
  alias Diluvia.Util.Query, as: Util

  plug :match
  plug :dispatch

  get "/:id" do
    send_resp(conn, 200, get_handler(id))
  end

  def get_handler(id) do
    Model.find(id) |> Map.from_struct |> JSON.to_json
  end


  put "/" do
    send_resp(conn, 200, JSON.to_json(%{hi: "hello"}))
  end

  match _ do
    send_resp(conn, 404, "forwarded-oops")
  end

end
