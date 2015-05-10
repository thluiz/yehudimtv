defmodule Yehudimtv.TvShow do
  use Yehudimtv.Web, :model

  schema "tvshows" do
    field :name, :string
    field :identifier, :string
    field :description, :string

    has_many :episodes, Yehudimtv.Episode

    timestamps
  end

  @required_fields ~w(name identifier description)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
