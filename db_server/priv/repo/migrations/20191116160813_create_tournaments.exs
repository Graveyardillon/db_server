defmodule DbServer.Repo.Migrations.CreateTournaments do
  use Ecto.Migration

  def change do
    create table(:tournaments) do
      add :name, :string
      add :game_id, references(:games)
      add :duration, :integer
      add :participation_deadline, :utc_datetime
      add :host_user, references(:users, type: :string, column: :id)
      add :team_number_limit, :integer
      add :player_number_limit, :integer
      add :is_private, :boolean

      timestamps()
    end
  end
end
