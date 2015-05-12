defmodule Yehudimtv.Router do
  use Yehudimtv.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
  end

  pipeline :admin do
    plug :protect_from_forgery
    plug :authenticate
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
  end

  scope "/", Yehudimtv do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/auth", Yehudimtv do
    pipe_through :browser
    get "/", AuthController, :index
    get "/callback", AuthController, :callback
    get "/logout", AuthController, :logout
  end

  scope "/admin", Yehudimtv do
    pipe_through [:browser, :admin]
    resources "/videos", VideoController
    resources "/episodes", EpisodeController
    resources "/tvshows", TvShowController
    resources "/users", UserController
    get "/", TvShowController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Yehudimtv do
    pipe_through :api
  end

  defp authenticate(conn, _params) do
    user_email = get_session(conn, :user_email)

    if user_email != nil and user_email != ""  do
      conn
    else
      conn
      |> redirect(to: "/auth")
    end
  end
end
