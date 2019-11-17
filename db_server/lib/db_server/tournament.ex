defmodule DbServer.Tournament do
  use Ecto.Schema

  @primary_key {:tournament_id, :id, autogenerate: true}

  schema "tournaments" do
    field :tournament_name, :string
    field :tournament_duration, :integer
    field :tournament_participation_deadline, :utc_datetime
    field :team_number_limit, :integer
    field :player_number_limit, :integer
    field :is_private, :boolean, default: false

    belongs_to :tournament_game_id, DbServer.Game, references: :game_id, type: :id
    belongs_to :host_user_id, DbServer.User, references: :user_id, type: :id

    timestamps()
  end
end