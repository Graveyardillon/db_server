defmodule DbServer.Repo.Migrations.Games do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :game_id, :integer, primary_key: true
      add :game_name, :string

      timestamps()
    end
  end
end
