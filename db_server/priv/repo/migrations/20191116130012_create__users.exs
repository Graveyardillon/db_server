defmodule DbServer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false
      add :gender, :integer
      add :bio, :string
      add :birthday, :utc_datetime, null: false
      add :hosting_experience, :integer
      #add :game_id, references(:games)

      timestamps()
    end
  end
end
