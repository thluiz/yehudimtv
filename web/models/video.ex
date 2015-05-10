defmodule Yehudimtv.Video do
  use Yehudimtv.Web, :model

  schema "videos" do
    field :identifier, :string
    field :amazon_identifier, :string
    field :title, :string
    field :description, :string
    field :order, :integer

    belongs_to :episode, Yehudimtv.Episode

    timestamps
  end

  @required_fields ~w(identifier amazon_identifier title description order episode_id)
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
