defmodule DbServer.Schema.ParticipatingTeam do
  use DbServer.AroundSchema

  schema "participating_teams" do
    many_to_many :users, User, join_through: "users"
    belongs_to :tournament, Tournament

    timestamps()
  end
end