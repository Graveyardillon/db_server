defmodule DbServer.Repo.Migrations.Games do
  use Ecto.Migration

  def change do
    create table(:games) do
      #add :game_id, :id, primary_key: true
      add :game_name, :string

      timestamps()
    end
  end
end
