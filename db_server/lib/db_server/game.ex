defmodule DbServer.Game do
  use Ecto.Schema

  @primary_key {:game_id, :id, autogenerate: true}

  schema "games" do
    field :game_name, :string

    timestamps()
  end
end