defmodule Yehudimtv.Router do
  use Yehudimtv.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
  end

  scope "/", Yehudimtv do
    pipe_through :browser # Use the default browser stack
    resources "/videos", VideoController
    resources "/episodes", EpisodeController
    resources "/tvshows", TvShowController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Yehudimtv do
    pipe_through :api
  end
end
