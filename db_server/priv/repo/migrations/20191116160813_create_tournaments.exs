defmodule DbServer.Repo.Migrations.CreateTournaments do
  use Ecto.Migration

  def change do
    create table(:tournaments) do
      add :tournament_name, :string
      add :tournament_game_id, references(:games)
      add :tournament_duration, :integer
      add :tournament_participation_deadline, :utc_datetime
      add :host_user, references(:users, type: :string, column: :user_id)
      add :team_number_limit, :integer
      add :player_number_limit, :integer
      add :is_private, :boolean

      timestamps()
    end
  end
end
