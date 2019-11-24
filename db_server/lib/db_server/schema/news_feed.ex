defmodule DbServer.Schema.NewsFeed do
  use DbServer.AroundSchema

  @primary_key {:news_feeds_id, :id, autogenerate: true}

  schema "news_feeds" do
    #belongs_to
    field :title, :string
    field :image_path, :string
    field :text, :string

    timestamps()
  end
end