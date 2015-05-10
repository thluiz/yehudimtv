defmodule Yehudimtv.VideoControllerTest do
  use Yehudimtv.ConnCase

  alias Yehudimtv.Video
  @valid_params video: %{amazon_identifier: "some content", description: "some content", episode_id: 42, identifier: "some content", order: 42, title: "some content"}
  @invalid_params video: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /videos", %{conn: conn} do
    conn = get conn, video_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing videos"
  end

  test "GET /videos/new", %{conn: conn} do
    conn = get conn, video_path(conn, :new)
    assert html_response(conn, 200) =~ "New video"
  end

  test "POST /videos with valid data", %{conn: conn} do
    conn = post conn, video_path(conn, :create), @valid_params
    assert redirected_to(conn) == video_path(conn, :index)
  end

  test "POST /videos with invalid data", %{conn: conn} do
    conn = post conn, video_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New video"
  end

  test "GET /videos/:id", %{conn: conn} do
    video = Repo.insert %Video{}
    conn = get conn, video_path(conn, :show, video)
    assert html_response(conn, 200) =~ "Show video"
  end

  test "GET /videos/:id/edit", %{conn: conn} do
    video = Repo.insert %Video{}
    conn = get conn, video_path(conn, :edit, video)
    assert html_response(conn, 200) =~ "Edit video"
  end

  test "PUT /videos/:id with valid data", %{conn: conn} do
    video = Repo.insert %Video{}
    conn = put conn, video_path(conn, :update, video), @valid_params
    assert redirected_to(conn) == video_path(conn, :index)
  end

  test "PUT /videos/:id with invalid data", %{conn: conn} do
    video = Repo.insert %Video{}
    conn = put conn, video_path(conn, :update, video), @invalid_params
    assert html_response(conn, 200) =~ "Edit video"
  end

  test "DELETE /videos/:id", %{conn: conn} do
    video = Repo.insert %Video{}
    conn = delete conn, video_path(conn, :delete, video)
    assert redirected_to(conn) == video_path(conn, :index)
    refute Repo.get(Video, video.id)
  end
end
