defmodule MyServer.HelloWorldPlug do
  import Plug.Conn
  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"msg\":\"hoge\"}")
  end
end