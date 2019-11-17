defmodule DbServer.Repo.Migrations.Wins do
  use Ecto.Migration
  # intermediate table

  def change do
    create table(:wins, primary_key: false) do
      add :win_id, :id, primary_key: true
      add :user_id, references(:users, type: :string, column: :user_id)
      add :tournament_id, references(:tournaments, type: :id, column: :tournament_id)
      add :win_count, :integer

      timestamps()
    end
  end
end
