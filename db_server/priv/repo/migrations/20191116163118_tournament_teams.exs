defmodule DbServer.Repo.Migrations.TournamentTeams do
  use Ecto.Migration

  def change do
    create table(:tournament_teams, primary_key: false) do
      add :user_id, references(:users, type: :string, column: :user_id), primary_key: true
      add :team_id, :integer
      add :tournament_id, references(:tournaments, type: :integer, column: :tournament_id)

      timestamps()
    end
  end
end
