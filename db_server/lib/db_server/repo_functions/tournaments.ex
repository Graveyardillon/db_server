defmodule DbServer.RepoFunctions.Tournaments do
  @moduledoc """
    The tournaments context.
  """
  use DbServer.AroundRepo

  def create_tournament(params \\ :empty) do
    %Tournament{}
    |> Tournament.changeset(params)
    |> Repo.insert()
  end

  def update_tournament(tournament \\ %{}, params) do
    tournament
    |> Tournament.changeset(params)
    |> Repo.update()
  end

  def delete_tournament(tournament \\ %{}) do
    Repo.delete(tournament)
  end

  def get_tournament(id \\ :empty) do
    Repo.get!(Tournament, id)
  end

  # Except for CRUD.
end