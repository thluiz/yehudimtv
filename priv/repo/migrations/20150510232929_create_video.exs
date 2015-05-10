defmodule Yehudimtv.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :identifier, :string
      add :amazon_identifier, :string
      add :title, :string
      add :description, :text
      add :order, :integer
      add :episode_id, :integer

      timestamps
    end

  end
end
