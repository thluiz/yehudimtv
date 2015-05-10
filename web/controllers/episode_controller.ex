defmodule Yehudimtv.EpisodeController do
  use Yehudimtv.Web, :controller

  alias Yehudimtv.Episode

  plug :scrub_params, "episode" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    episodes = Repo.all(Episode)
    render(conn, "index.html", episodes: episodes)
  end

  def new(conn, _params) do
    changeset = Episode.changeset(%Episode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"episode" => episode_params}) do
    changeset = Episode.changeset(%Episode{}, episode_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Episode created successfully.")
      |> redirect(to: episode_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    episode = Repo.get(Episode, id)
    render(conn, "show.html", episode: episode)
  end

  def edit(conn, %{"id" => id}) do
    episode = Repo.get(Episode, id)
    changeset = Episode.changeset(episode)
    render(conn, "edit.html", episode: episode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "episode" => episode_params}) do
    episode = Repo.get(Episode, id)
    changeset = Episode.changeset(episode, episode_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Episode updated successfully.")
      |> redirect(to: episode_path(conn, :index))
    else
      render(conn, "edit.html", episode: episode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    episode = Repo.get(Episode, id)
    Repo.delete(episode)

    conn
    |> put_flash(:info, "Episode deleted successfully.")
    |> redirect(to: episode_path(conn, :index))
  end
end
