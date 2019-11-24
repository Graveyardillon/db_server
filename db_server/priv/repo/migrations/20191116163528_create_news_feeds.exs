defmodule DbServer.Repo.Migrations.CreateNewsFeeds do
  use Ecto.Migration

  def change do
    create table(:news_feeds) do
      add :game_id, references(:games)
      add :title, :string
      add :image_path, :string
      add :text, :string

      timestamps()
    end
  end
end
