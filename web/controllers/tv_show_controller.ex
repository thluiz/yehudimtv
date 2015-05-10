defmodule Yehudimtv.TvShowController do
  use Yehudimtv.Web, :controller

  alias Yehudimtv.TvShow

  plug :scrub_params, "tv_show" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    tvshows = Repo.all(TvShow)
    render(conn, "index.html", tvshows: tvshows)
  end

  def new(conn, _params) do
    changeset = TvShow.changeset(%TvShow{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tv_show" => tv_show_params}) do
    changeset = TvShow.changeset(%TvShow{}, tv_show_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "TvShow created successfully.")
      |> redirect(to: tv_show_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tv_show = Repo.get(TvShow, id)
    render(conn, "show.html", tv_show: tv_show)
  end

  def edit(conn, %{"id" => id}) do
    tv_show = Repo.get(TvShow, id)
    changeset = TvShow.changeset(tv_show)
    render(conn, "edit.html", tv_show: tv_show, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tv_show" => tv_show_params}) do
    tv_show = Repo.get(TvShow, id)
    changeset = TvShow.changeset(tv_show, tv_show_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "TvShow updated successfully.")
      |> redirect(to: tv_show_path(conn, :index))
    else
      render(conn, "edit.html", tv_show: tv_show, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tv_show = Repo.get(TvShow, id)
    Repo.delete(tv_show)

    conn
    |> put_flash(:info, "TvShow deleted successfully.")
    |> redirect(to: tv_show_path(conn, :index))
  end
end
