defmodule Yehudimtv.EpisodeTest do
  use Yehudimtv.ModelCase

  alias Yehudimtv.Episode

  @valid_attrs %{identifier: "some content", order: 42, publication: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, rabbi: "some content", spotlight: true, title: "some content", tvshow_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Episode.changeset(%Episode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Episode.changeset(%Episode{}, @invalid_attrs)
    refute changeset.valid?
  end
end
