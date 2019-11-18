defmodule DbServer.Repo.Migrations.ParticipatingTeams do
  use Ecto.Migration

  def change do
    create table(:participating_teams) do
      add :tournament_id, references(:tournaments)

      timestamps()
    end
  end
end
