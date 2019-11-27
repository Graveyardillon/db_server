defmodule DbServer.Schema.ParticipatingTeam do
  use DbServer.AroundSchema

  schema "participating_teams" do
    many_to_many :user, User, join_through: "participating_teams_users", on_delete: :delete_all
    belongs_to :tournament, Tournament

    timestamps()
  end

  @doc false
  def put_assoc(participating_team, %User{} = user) do
    participating_team
    |> change()
    |> put_assoc(:user, [user])
    |> foreign_key_constraint(:user)
  end
end