defmodule DbServer.Repo.Migrations.ParticipatingTeams do
  use Ecto.Migration

  def change do
    create table(:participating_teams, primary_key: false) do
      add :team_id, :id, primary_key: true
      add :tournament_id, references(:tournaments, type: :id, column: :tournament_id)

      timestamps()
    end
  end
end
