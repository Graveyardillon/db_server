defmodule DbServer.Repo.Migrations.Tournaments do
  use Ecto.Migration

  def change do
    create table(:tournaments, primary_key: false) do
      add :tournament_id, :integer, primary_key: true
      add :tournament_name, :string
      add :tournament_game_id, references(:games, column: :game_id)
      add :tournament_duration, :integer
      add :tournament_deadline, :utc_datetime
      add :host_user, references(:users, type: :string, column: :user_id)
      add :team_number_limit, :integer
      add :player_number_limit, :integer

      timestamps()
    end
  end
end
