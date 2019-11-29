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
  def changeset(game, params \\ :empty) do
    game
    |> cast(params, [:name])
    |> validate_required(:name, message: "Game name is required.")
    |> unique_constraint(:name, message: "The game already exists.")
  end

  @doc false
  def build_assoc(game, news_feed) do
    game
    |> build_assoc(:news_feeds, news_feed)
  end
end