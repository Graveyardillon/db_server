defmodule DbServer.Schema.Game do
  use DbServer.AroundSchema
  
  schema "games" do
    field :name, :string

    many_to_many :users, User, join_through: "games_users", on_delete: :delete_all
    has_one :tournament, Tournament
    has_many :news_feeds, NewsFeed

    timestamps()
  end

  @doc false
  def changeset(game, params) do
    game
    |> cast(params, [:name])
    |> unique_constraint(:name, message: "The game already exists.")
  end

  @doc false
  def build_tournament_assoc(game, tournament) do
    game
    |> build_assoc(:tournament, tournament)
  end

  @doc false
  def build_news_feed_assoc(game, news_feed) do
    game
    |> build_assoc(:news_feeds, news_feed)
  end
end