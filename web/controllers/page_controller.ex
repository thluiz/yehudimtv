defmodule Yehudimtv.PageController do
  use Yehudimtv.Web, :controller

  plug :action

  def index(conn, _params) do
    put_layout(conn, {Yehudimtv.PageView, "external"})
    
    render conn, "index.html"
  end
end
