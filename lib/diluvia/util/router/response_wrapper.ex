defmodule ResponseWrapper do
  import Plug.Conn

  def basic_wrap_and_send(conn, status, body) do
    conn |> basic_decorate |> send_resp(status, body)
  end

  defp basic_decorate(conn) do
    conn
    |> put_resp_header("access-control-allow-origin",
                       "http://hello.diluvia.dev")
    |> put_resp_header("access-control-allow-headers",
                       "Origin, X-Requested-With, Content-Type, Accept")
    |> put_resp_header("content-type", "application/json")
  end

end
