defmodule DbServer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :string, primary_key: true
      add :user_name, :string
      add :user_email, :string
      add :user_password, :string
      add :user_gender, :integer
      add :user_bio, :string
      add :user_birthday, :utc_datetime
      add :user_hosting_experience, :integer
      add :following_games_id, references(:games)

      timestamps()
    end
  end
end