defmodule Yehudimtv.TvShowTest do
  use Yehudimtv.ModelCase

  alias Yehudimtv.TvShow

  @valid_attrs %{description: "some content", identifier: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TvShow.changeset(%TvShow{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TvShow.changeset(%TvShow{}, @invalid_attrs)
    refute changeset.valid?
  end
end
