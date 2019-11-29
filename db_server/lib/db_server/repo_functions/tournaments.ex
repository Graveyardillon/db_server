defmodule DbServer.RepoFunctions.Tournaments do
  @moduledoc """
    The tournaments context.
  """
  use DbServer.AroundRepo

  def create(params \\ :empty) do
    %Tournament{}
    |> Tournament.changeset(params)
    |> Repo.insert()
  end

  def update(tournament \\ %{}, params) do
    tournament
    |> Tournament.changeset(params)
    |> Repo.update()
  end

  def delete(tournament \\ %{}) do
    Repo.delete(tournament)
  end

  def get(id \\ :empty) do
    Repo.get!(Tournament, id)
  end

  # Except for CRUD.
  def add_participating_team_relation() do
    
  end
end