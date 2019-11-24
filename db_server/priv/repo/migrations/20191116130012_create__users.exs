defmodule DbServer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string
      add :email, :string
      add :password, :string
      add :gender, :integer
      add :bio, :string
      add :birthday, :utc_datetime
      add :hosting_experience, :integer
      add :game_id, references(:games)

      timestamps()
    end
  end
end
