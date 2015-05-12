defmodule Yehudimtv.AuthController do
  use Yehudimtv.Web, :controller
  alias Yehudimtv.User

  plug :action

  def index(conn, _params) do
    redirect conn, external: Google.authorize_url!
  end

  def logout(conn, _params) do
    conn
    |> put_session(:user_email, "")
    |> put_session(:access_token, "")
    |> redirect(to: "/")
  end

  def callback(conn, %{"code" => code}) do
    email = Google.get_user_email code

    if User.exists?(%{ :email => email }) do
      conn
        |> put_session(:user_email, email)
        |> redirect(to: "/admin")
    else
      conn
        |> put_session(:user_email, nil)
        |> redirect(to: "/admin/not_found")
    end
  end

end
