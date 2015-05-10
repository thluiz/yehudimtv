defmodule Yehudimtv.Episode do
  use Yehudimtv.Web, :model

  schema "episodes" do
    field :title, :string
    field :rabbi, :string
    field :identifier, :string
    field :publication, Ecto.DateTime
    field :order, :integer
    field :spotlight, :boolean, default: false

    has_many :videos, Yehudimtv.Video
    belongs_to :tvshow, Yehudimtv.TvShow

    timestamps
  end

  @required_fields ~w(title rabbi identifier tvshow_id publication order spotlight)
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
