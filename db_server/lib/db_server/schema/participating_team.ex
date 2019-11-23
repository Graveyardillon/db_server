defmodule DbServer.Schema.ParticipatingTeam do
  use DbServer.AroundSchema

  @primary_key {:team_id, :id, autogenerate: true}

  schema "participating_teams" do
    #belongs_to

    timestamps()
  end
end