defmodule DbServer.Repo.Migrations.CreateNewsFeeds do
  use Ecto.Migration

  def change do
    create table(:news_feeds) do
      add :game_id, references(:games)
      add :news_feed_title, :string
      add :news_feed_image_path, :string
      add :news_feed_text, :string

      timestamps()
    end
  end
end
