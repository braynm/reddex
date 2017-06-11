defmodule Reddit.Plug do
  import Plug.Conn
  import Reddit.Router

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn
  end
end
