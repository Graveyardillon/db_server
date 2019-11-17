defmodule DbServer.ParticipatingTeam do
  use Ecto.Schema

  @primary_key {:team_id, :id, autogenerate: true}

  schema "participating_teams" do
    #belongs_to

    timestamps()
  end
end