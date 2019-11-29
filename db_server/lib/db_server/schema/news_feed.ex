defmodule DbServer.Schema.NewsFeed do
  use DbServer.AroundSchema

  schema "news_feeds" do
    belongs_to :game, Game
    field :title, :string
    field :image_path, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(news_feed, params \\ :empty) do
    news_feed
    |> cast(params, [:game, :title, :image_path, :text])
    |> validate_required([:title, :text])
  end
end