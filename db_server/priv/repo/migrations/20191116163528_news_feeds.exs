defmodule DbServer.Repo.Migrations.NewsFeeds do
  use Ecto.Migration

  def change do
    create table(:news_feeds, primary_key: false) do
      add :news_feed_id, :integer, primary_key: true
      add :game_id, references(:games, type: :integer, column: :game_id)
      add :news_feed_title, :string
      add :news_feed_image_path, :string
      add :news_feed_test, :string

      timestamps()
    end
  end
end
