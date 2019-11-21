defmodule DbServer.Schema.Tournament do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tournaments" do
    field :tournament_name, :string
    field :tournament_duration, :integer
    field :tournament_participation_deadline, :utc_datetime
    field :team_number_limit, :integer
    field :player_number_limit, :integer
    field :is_private, :boolean, default: false

    belongs_to :tournament_game_id, DbServer.Schema.Game, references: :game_id, type: :id
    belongs_to :host_user_id, DbServer.Schema.User, references: :user_id, type: :id

    timestamps()
  end

  def changeset(tournament, params \\ :empty) do
    tournament
    |> cast(params, [:tournament_name, :tournament_duration, :tournament_participation_deadline, :team_number_limit, :player_number_limit, :is_private])
    |> validate_required([:tournament_name, :tournament_duration, :tournament_participation_deadline, :team_number_limit, :player_number_limit, :is_private])
    |> validate_number(:team_number_limit, greater_than: 1)
    |> validate_number(:team_number_limit, greater_than: 1)
  end
end