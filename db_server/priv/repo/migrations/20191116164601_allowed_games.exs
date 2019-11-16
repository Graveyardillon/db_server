defmodule DbServer.Repo.Migrations.AllowedGames do
  use Ecto.Migration

  def change do
    create table(:allowed_games) do
      add :user_id, references(:users, type: :string, column: :user_id)
      add :game_id, references(:games, type: :integer, column: :game_id)

      timestamps()
    end
  end
end
