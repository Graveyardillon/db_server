defmodule DbServer.Repo.Migrations.NewsFeeds do
  use Ecto.Migration

  def change do
    create table(:news_feeds, primary_key: false) do
      add :news_feed_id, :id, primary_key: true
      add :game_id, references(:games, type: :id, column: :game_id)
      add :news_feed_title, :string
      add :news_feed_image_path, :string
      add :news_feed_text, :string

      timestamps()
    end
  end
end
