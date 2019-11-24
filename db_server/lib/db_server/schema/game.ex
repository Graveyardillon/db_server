defmodule DbServer.Schema.Game do
  use DbServer.AroundSchema
  
  schema "games" do
    field :name, :string

    many_to_many :users, User, join_through: "users"
    has_one :tournaments_game, Tournament

    timestamps()
  end

  def changeset(game, params \\ :empty) do
    game
    |> cast(params, [:name])
    |> validate_required(:name)
    |> unique_constraint(:name, message: "The game already exists.")
  end
end