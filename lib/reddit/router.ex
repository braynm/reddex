defmodule Reddit.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "World")
  end
 
  forward "/r", to: Reddit.SubRedditRouter
  match _ do
    send_resp(conn, 400, "oops")
  end
end
