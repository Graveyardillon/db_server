defmodule DbServer.Schema.Game do
  use DbServer.AroundSchema
  
  schema "games" do
    field :game_name, :string

    many_to_many :users, User, join_through: "users"
    has_one :tournaments_game, Tournament

    timestamps()
  end

  def changeset(game, params \\ :empty) do
    game
    |> cast(params, [:game_name])
    |> validate_required(:game_name)
    |> unique_constraint(:game_name, message: "The game already exists.")
  end
end