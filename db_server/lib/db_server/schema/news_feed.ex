defmodule DbServer.Schema.NewsFeed do
  use DbServer.AroundSchema

  @primary_key {:news_feeds_id, :id, autogenerate: true}

  schema "news_feeds" do
    #belongs_to
    field :news_feed_title, :string
    field :news_feed_image_path, :string
    field :news_feed_text, :string

    timestamps()
  end
end