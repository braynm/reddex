defmodule PlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Reddit.Router.init([])

  test "returns hello world" do
    # create test connection
    conn = conn(:get, "/hello")
    conn = Reddit.Router.call(conn, @opts)
    #assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "world"
  end
end
