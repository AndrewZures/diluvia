defmodule Diluvia.User.Router do
  import Plug.Conn
  use Plug.Router

  alias Diluvia.User.Model, as: Model

  plug :match
  plug :dispatch


  get "/:id" do
    { status, user_data } = id |> String.to_integer |> Model.find

    body = user_data |> JSON.to_json
    IO.puts 'here'
    IO.puts conn.method
    conn = decorate_response(conn)
    send_resp(conn, http_status(status), body)
  end

  put "/:id" do
    body = read_body(conn) |> elem(1) |> JSON.from_json
    id = id |> String.to_integer

    { status, body } = Model.update(id, body)
    body = body |> JSON.to_json
    send_resp(conn, http_status(status), body)
  end

  options "/:id" do
    IO.puts "options route"
    IO.puts conn.method
    conn = decorate_response(conn)
    send_resp(conn, 200, "cool beans")
  end

  match _ do
    IO.puts 'WHOA'
    IO.puts conn.method
    no_match = %{ message: "no matching route" } |> JSON.to_json
    send_resp(conn, 404, no_match)
  end


  def decorate_response(conn) do
    conn = put_resp_header(conn, "access-control-allow-origin", "*")
    conn = put_resp_header(conn, "content-type", "application/json")
    conn
  end

  def http_status(status) do
    if status == :ok, do: 200, else:  422
  end

end
