defmodule Yehudimtv.User do
  use Yehudimtv.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string

    timestamps
  end

  @required_fields ~w(name email)
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

  def exists?(%{:email => email}) do
    count = (from u in Yehudimtv.User, where: u.email == ^email, select: u)
    |> Yehudimtv.Repo.all  |> Enum.count

    count > 0
  end
end
