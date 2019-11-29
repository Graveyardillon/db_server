defmodule DbServer.RepoFunctions.ParticipatingTeams do
  @moduledoc """
    The participating teams context.
    This file is different to conventional function files.
  """
  use DbServer.AroundRepo

  def create(tournament) do
    tournament
    |> Tournament.assoc_changeset()
    |> Repo.insert()
  end

  def get(id \\ :empty) do
    Repo.get!(ParticipatingTeam, id)
    |> Repo.preload([:user])
  end

  # Except for crud test.
  def add_member_relation(participating_team, user \\ %{}) do
    participating_team
    |> Repo.preload([:user])
    |> ParticipatingTeam.put_assoc(user)
  end

  def update(changeset) do
    changeset
    |> Repo.update()
  end
end