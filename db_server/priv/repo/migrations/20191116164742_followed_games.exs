defmodule DbServer.Repo.Migrations.FollowedGames do
  use Ecto.Migration

  def change do
    create table(:followed_games) do
      add :user_id, references(:users, type: :string, column: :user_id)
      add :game_id, references(:games, type: :integer, column: :game_id)

      timestamps()
    end
  end
end
