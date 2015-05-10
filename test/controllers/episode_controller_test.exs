defmodule Yehudimtv.EpisodeControllerTest do
  use Yehudimtv.ConnCase

  alias Yehudimtv.Episode
  @valid_params episode: %{identifier: "some content", order: 42, publication: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, rabbi: "some content", spotlight: true, title: "some content", tvshow_id: 42}
  @invalid_params episode: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /episodes", %{conn: conn} do
    conn = get conn, episode_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing episodes"
  end

  test "GET /episodes/new", %{conn: conn} do
    conn = get conn, episode_path(conn, :new)
    assert html_response(conn, 200) =~ "New episode"
  end

  test "POST /episodes with valid data", %{conn: conn} do
    conn = post conn, episode_path(conn, :create), @valid_params
    assert redirected_to(conn) == episode_path(conn, :index)
  end

  test "POST /episodes with invalid data", %{conn: conn} do
    conn = post conn, episode_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New episode"
  end

  test "GET /episodes/:id", %{conn: conn} do
    episode = Repo.insert %Episode{}
    conn = get conn, episode_path(conn, :show, episode)
    assert html_response(conn, 200) =~ "Show episode"
  end

  test "GET /episodes/:id/edit", %{conn: conn} do
    episode = Repo.insert %Episode{}
    conn = get conn, episode_path(conn, :edit, episode)
    assert html_response(conn, 200) =~ "Edit episode"
  end

  test "PUT /episodes/:id with valid data", %{conn: conn} do
    episode = Repo.insert %Episode{}
    conn = put conn, episode_path(conn, :update, episode), @valid_params
    assert redirected_to(conn) == episode_path(conn, :index)
  end

  test "PUT /episodes/:id with invalid data", %{conn: conn} do
    episode = Repo.insert %Episode{}
    conn = put conn, episode_path(conn, :update, episode), @invalid_params
    assert html_response(conn, 200) =~ "Edit episode"
  end

  test "DELETE /episodes/:id", %{conn: conn} do
    episode = Repo.insert %Episode{}
    conn = delete conn, episode_path(conn, :delete, episode)
    assert redirected_to(conn) == episode_path(conn, :index)
    refute Repo.get(Episode, episode.id)
  end
end
