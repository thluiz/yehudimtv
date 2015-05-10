defmodule Yehudimtv.Repo.Migrations.CreateEpisode do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :title, :string
      add :rabbi, :string
      add :identifier, :string
      add :tvshow_id, :integer
      add :publication, :datetime
      add :order, :integer
      add :spotlight, :boolean, default: false

      timestamps
    end

  end
end
