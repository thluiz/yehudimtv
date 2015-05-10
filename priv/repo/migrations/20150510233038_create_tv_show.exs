defmodule Yehudimtv.Repo.Migrations.CreateTvShow do
  use Ecto.Migration

  def change do
    create table(:tvshows) do
      add :name, :string
      add :identifier, :string
      add :description, :text

      timestamps
    end

  end
end
