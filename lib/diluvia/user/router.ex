defmodule Diluvia.User.Router do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/:id" do
    send_resp(conn, 200, JSON.to_json(get_handler(id)))
  end

  def get_handler(id) do
    %{hi: "hello #{id}"}
  end


  put "/" do
    send_resp(conn, 200, JSON.to_json(%{hi: "hello"}))
  end

  match _ do
    send_resp(conn, 404, "forwarded-oops")
  end

end
