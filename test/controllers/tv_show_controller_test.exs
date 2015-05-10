defmodule Yehudimtv.TvShowControllerTest do
  use Yehudimtv.ConnCase

  alias Yehudimtv.TvShow
  @valid_params tv_show: %{description: "some content", identifier: "some content", name: "some content"}
  @invalid_params tv_show: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /tvshows", %{conn: conn} do
    conn = get conn, tv_show_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tvshows"
  end

  test "GET /tvshows/new", %{conn: conn} do
    conn = get conn, tv_show_path(conn, :new)
    assert html_response(conn, 200) =~ "New tv_show"
  end

  test "POST /tvshows with valid data", %{conn: conn} do
    conn = post conn, tv_show_path(conn, :create), @valid_params
    assert redirected_to(conn) == tv_show_path(conn, :index)
  end

  test "POST /tvshows with invalid data", %{conn: conn} do
    conn = post conn, tv_show_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New tv_show"
  end

  test "GET /tvshows/:id", %{conn: conn} do
    tv_show = Repo.insert %TvShow{}
    conn = get conn, tv_show_path(conn, :show, tv_show)
    assert html_response(conn, 200) =~ "Show tv_show"
  end

  test "GET /tvshows/:id/edit", %{conn: conn} do
    tv_show = Repo.insert %TvShow{}
    conn = get conn, tv_show_path(conn, :edit, tv_show)
    assert html_response(conn, 200) =~ "Edit tv_show"
  end

  test "PUT /tvshows/:id with valid data", %{conn: conn} do
    tv_show = Repo.insert %TvShow{}
    conn = put conn, tv_show_path(conn, :update, tv_show), @valid_params
    assert redirected_to(conn) == tv_show_path(conn, :index)
  end

  test "PUT /tvshows/:id with invalid data", %{conn: conn} do
    tv_show = Repo.insert %TvShow{}
    conn = put conn, tv_show_path(conn, :update, tv_show), @invalid_params
    assert html_response(conn, 200) =~ "Edit tv_show"
  end

  test "DELETE /tvshows/:id", %{conn: conn} do
    tv_show = Repo.insert %TvShow{}
    conn = delete conn, tv_show_path(conn, :delete, tv_show)
    assert redirected_to(conn) == tv_show_path(conn, :index)
    refute Repo.get(TvShow, tv_show.id)
  end
end
