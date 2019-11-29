defmodule DbServer.Repo.Migrations.CreateWins do
  use Ecto.Migration
  # intermediate table

  def change do
    create table(:wins) do
      add :user_id, references(:users, type: :string, column: :id)
      add :tournament_id, references(:tournaments)
      add :win_count, :integer, null: false

      timestamps()
    end
  end
end
