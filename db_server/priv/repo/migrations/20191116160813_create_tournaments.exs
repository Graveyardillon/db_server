defmodule DbServer.Repo.Migrations.CreateTournaments do
  use Ecto.Migration

  def change do
    create table(:tournaments) do
      add :name, :string, null: false
      add :game_id, references(:games)#TODO:, null: false
      add :duration, :integer, null: false
      add :participation_deadline, :utc_datetime, null: false
      add :user_id, references(:users, type: :string, column: :id)
      add :team_number_limit, :integer, null: false
      add :player_number_limit, :integer, null: false
      add :is_private, :boolean

      timestamps()
    end
  end
end
