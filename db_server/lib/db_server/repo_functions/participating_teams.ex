defmodule DbServer.RepoFunctions.ParticipatingTeams do
  @moduledoc """
    The participating teams context.
    This is not a usual function file.
  """
  use DbServer.AroundRepo

  def create_participating_team(tournament) do
    tournament
    |> Tournament.assoc_changeset()
    |> Repo.insert()
  end

  def get_participating_team(id \\ :empty) do
    Repo.get!(ParticipatingTeam, id)
  end
end