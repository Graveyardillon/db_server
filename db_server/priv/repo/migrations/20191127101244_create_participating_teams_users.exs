defmodule DbServer.Repo.Migrations.CreateParticipatingTeamsUsers do
  use Ecto.Migration

  def change do
    create table(:participating_teams_users) do
      add :participating_team_id, references(:participating_teams), on_delete: :delete_all
      add :user_id, references(:users, type: :string), on_delete: :delete_all
    end

    create unique_index(:participating_teams_users, [:participating_team_id, :user_id])
  end
end
