defmodule DbServer.Schema.Tournament do
  use DbServer.AroundSchema

  schema "tournaments" do
    field :name, :string
    field :duration, :integer
    field :participation_deadline, :utc_datetime
    field :team_number_limit, :integer
    field :player_number_limit, :integer
    field :is_private, :boolean, default: false

    belongs_to :game, Game
    belongs_to :user, User

    has_one :participating_team, ParticipatingTeam

    timestamps()
  end

  def changeset(tournament, params \\ :empty) do
    tournament
    |> cast(params, [:name, :duration, :participation_deadline, :team_number_limit, :player_number_limit, :is_private])
    |> validate_required([:name, :duration, :participation_deadline, :team_number_limit, :player_number_limit, :is_private])
    |> validate_number(:team_number_limit, greater_than: 1)
    |> validate_number(:team_number_limit, greater_than: 1)
  end

  def assoc_changeset(tournament, %ParticipatingTeam{} = participating_team) do
    tournament
    |> build_assoc(:participating_team, participating_team)
    |> change()
  end
end