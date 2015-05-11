defmodule Yehudimtv.AuthController do
  use Yehudimtv.Web, :controller

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
    token = Google.get_token!(code: code)
    user_data = OAuth2.AccessToken.get!(token, "https://www.googleapis.com/plus/v1/people/me")
    email = user_data["emails"] |> List.first

    conn
    |> put_session(:user_email, email["value"])
    |> put_session(:access_token, token.access_token)
    |> redirect(to: "/admin")
  end
end
