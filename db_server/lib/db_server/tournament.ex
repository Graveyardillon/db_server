defmodule DbServer.Tournament do
  use Ecto.Schema

  @primary_key {:tournament_id, :id, autogenerate: true}

  schema "tournaments" do
    field :tournament_name, :string
    #belongs_to
    field :tournament_duration, :integer
    field :tournament_participation_deadline, :utc_datetime
    #belongs_to
    field :team_number_limit, :integer
    field :player_number_limit, :integer
    field :is_private, :boolean, default: false

    timestamps()
  end

end