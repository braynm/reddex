defmodule Reddit.SubRedditRouter do
  use Plug.Router
  
  plug :match
  plug :dispatch
  get "/:subName" do
    send_resp(conn, 200, "#{subName}")
  end

end
