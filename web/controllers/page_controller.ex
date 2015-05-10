defmodule Yehudimtv.PageController do
  use Yehudimtv.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
