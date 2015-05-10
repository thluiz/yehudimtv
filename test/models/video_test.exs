defmodule Yehudimtv.VideoTest do
  use Yehudimtv.ModelCase

  alias Yehudimtv.Video

  @valid_attrs %{amazon_identifier: "some content", description: "some content", episode_id: 42, identifier: "some content", order: 42, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
